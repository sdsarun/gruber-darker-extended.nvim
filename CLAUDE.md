# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A personal fork of `blazkowolf/gruber-darker.nvim`, extended with highlight groups for the LazyVim plugin ecosystem (snacks.nvim, noice.nvim, bufferline.nvim, neo-tree.nvim, which-key.nvim, mason.nvim, trouble.nvim, todo-comments.nvim, flash.nvim, blink.cmp, render-markdown.nvim, indent-blankline.nvim, rainbow-delimiters.nvim, gitsigns.nvim). Not intended for general distribution — tuned for one user's LazyVim setup.

## Commands

- Format: `stylua .` (config in `.stylua.toml`: tabs, width 2, 120 cols, always-parens calls, sorted requires)
- No test suite, no linter config, no CI workflow in this repo.
- Manually verify changes by loading the colorscheme in Neovim: `:colorscheme gruber-darker` (or restart nvim if it's set as the default), then exercise the plugin UI whose highlight groups you changed (e.g. open the snacks picker, noice cmdline, bufferline, etc.).
- `release.sh` is a local-only release helper (tags `vX.Y.Z` from conventional commits and pushes the tag) — not run in CI, intentionally gitignored from automation.

## Architecture

**Entry point**: `colors/gruber-darker.lua` just calls `require("gruber-darker").load()`. That's the only file Neovim's `:colorscheme` command touches directly.

**Load flow** (`lua/gruber-darker.lua`):
1. `M.load()` clears any existing highlights, sets `termguicolors`, sets `vim.g.colors_name`, then calls `highlights.setup()`.
2. Registers autocmds: clears the `GruberDarker` augroup when switching away to another colorscheme (`ColorSchemePre`), sets `qf`/`help` windows to use `NormalSB`/`SignColumnSB`, and on every `ColorScheme` event clears all `@lsp` semantic highlight groups (mitigation so LSP semantic tokens don't fight with treesitter highlights — see comment at `lua/gruber-darker.lua:31`).

**Highlight providers** (`lua/gruber-darker/highlights/init.lua`): a fixed, ordered list of provider modules, each implementing `{ highlights: table<string, Highlight>, setup: fun() }`. `highlights.setup()` just iterates the list and calls `:setup()` on each. Order in the list matters for any groups that `link` to a group defined by an earlier provider. One file per plugin/concern: `vim.lua` (core UI groups, also the base that other groups link into via `vim_hl`), `treesitter.lua`, `lsp.lua`, `terminal.lua`, `cmp.lua`, `telescope.lua`, `rainbow.lua`, `snacks.lua`, `noice.lua`, `ui.lua`, `editor.lua`, `colorscheme.lua`.

**Adding/editing highlight groups for a plugin**: edit (or add) the corresponding file under `lua/gruber-darker/highlights/`. Each module builds a `M.highlights` table of `Highlight.new("GroupName", { fg = c.xxx, bg = c.yyy, ... })` entries and exposes `M.setup()` to apply them via `vim.api.nvim_set_hl`. If adding a new plugin module, register it in the `providers` list in `lua/gruber-darker/highlights/init.lua`.

**Critical gotcha**: highlight group names must exactly match what the target plugin actually registers (check the plugin's own source, e.g. `~/.local/share/nvim/lazy/<plugin>/lua/.../highlights.lua`, for the canonical names and `prefix`). A misspelled or guessed group name silently does nothing — Neovim won't error, the group just falls back to the plugin's own default link (often `NonText`/`Comment`, producing low-contrast/invisible text), so always verify against the plugin source rather than guessing from convention.

**Color/palette layer**:
- `lua/gruber-darker/palette.lua` — the single source of truth for color values, keyed by semantic name (e.g. `bg`, `bg+1`..`bg+4`, `fg`, `fg+1`, `fg+2`, `red-1`/`red`/`red+1`, `niagara-2`/`niagara-1`/`niagara`, `quartz`, `brown`, `wisteria`, `none`). The `+N`/`-N` suffixes denote lighter/darker variants of a base hue — reuse existing palette entries rather than inventing new raw hex values in a highlights file.
- `lua/gruber-darker/color.lua` — `Color` class wrapping a hex int; `Color:to_string()` renders `#rrggbb` (or `"NONE"` for `Color.none()`).
- `lua/gruber-darker/highlight.lua` — `Highlight` class; `Highlight.new(group, opts)` stores the group name + an `nvim_set_hl`-shaped opts table (`fg`/`bg`/`sp`/`link`/`bold`/`italic`/etc., using `Color` objects for color fields and another `Highlight` for `link`); `Highlight:setup()` resolves and applies it.

**Config** (`lua/gruber-darker/config.lua`): singleton `ConfigMgr` merging user `opts` over `DEFAULTS` (`bold`, `invert.{signs,tabline,visual}`, `italic.{strings,comments,operators,folds}`, `undercurl`, `underline`) via `vim.tbl_deep_extend`. Once `setup()` has been called once, subsequent calls are no-ops (`instance ~= nil` short-circuits). Highlight provider modules read resolved options through `require("gruber-darker.config").get_opts()` rather than touching `DEFAULTS` directly.

**`extras/`**: standalone, non-Lua color definitions for terminal emulators (Alacritty, Ghostty, Kitty, Windows Terminal) that mirror the palette for users who want terminal-level (not just Neovim) theming. These are static config files, not generated from `palette.lua` — if the palette changes, update these manually if parity matters.
