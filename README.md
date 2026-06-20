# gruber-darker-extended.nvim

_A personal fork of [gruber-darker.nvim][upstream] with extended plugin highlight support for [LazyVim][lazyvim]_

> **Note**
> This is a personal configuration fork — not intended for general use

![image](https://user-images.githubusercontent.com/9439488/229402983-b27a2fc4-d938-4ed0-8f7f-7711f73aa985.png)

## Installation

### Lazy

```lua
{
  "sdsarun/gruber-darker-extended.nvim",
  name = "gruber-darker",
}
```

Then, somewhere in your `init.lua`, set the colorscheme

```lua
vim.cmd.colorscheme("gruber-darker")
```

## Configuration

### Defaults

```lua
{
  bold = true,
  invert = {
    signs = false,
    tabline = false,
    visual = false,
  },
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  undercurl = true,
  underline = true,
}
```

### With updated preferences

Change configuration options by calling `setup()` prior to loading the colorscheme.
Your preferences will be merged with the defaults.

```lua
{
  "sdsarun/gruber-darker-extended.nvim",
  name = "gruber-darker",
  opts = {
    bold = false,
    italic = {
      strings = false,
    },
  },
}
```

## LazyVim Setup

Create `~/.config/nvim/lua/plugins/colorscheme.lua`:

```lua
return {
  {
    "sdsarun/gruber-darker-extended.nvim",
    name = "gruber-darker", -- required: colorscheme name must match
    lazy = false,
    priority = 1000,
    opts = {
      bold = true,
      italic = {
        strings = true,
        comments = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruber-darker",
    },
  },
}
```

## Extended Plugin Support

This fork adds highlight groups for the following plugins beyond the upstream:

| Plugin | Groups |
|--------|--------|
| [snacks.nvim][snacks] | Dashboard, Picker, Notifier, Indent guides, Words, Input, Zen |
| [noice.nvim][noice] | Cmdline, Popup, Scrollbar, Mini, Virtual text, LSP progress, Format tokens |
| [bufferline.nvim][bufferline] | Full buffer/tab/diagnostic/pick groups |
| [neo-tree.nvim][neo-tree] | File tree, git status, tabs |
| [which-key.nvim][which-key] | Key, group, desc, float |
| [mason.nvim][mason] | Header, highlight, muted, error |
| [trouble.nvim][trouble] | Diagnostics panel, signs, icons |
| [todo-comments.nvim][todo-comments] | TODO, FIXME, HACK, WARN, NOTE, PERF, TEST |
| [flash.nvim][flash] | Backdrop, match, label, cursor, prompt |
| [blink.cmp][blink-cmp] | Menu, label, kind icons, doc, signature help, ghost text |
| [render-markdown.nvim][render-markdown] | Headings, code blocks, bullets, links, tables, quotes |
| [indent-blankline.nvim][ibl] | Indent, scope, whitespace (v2 + v3) |
| [rainbow-delimiters.nvim][rainbow] | Rainbow bracket levels |
| [gitsigns.nvim][gitsigns] | Sign column git status |

## Credits

- [blazkowolf/gruber-darker.nvim][upstream] — original Neovim port this fork is based on
- [rexim/gruber-darker-theme][gruber-darker-theme]
- [folke/tokyonight.nvim][tokyonight]
- [drsooch/gruber-darker-vim][gruber-darker-vim]

[upstream]: https://github.com/blazkowolf/gruber-darker.nvim
[lazyvim]: https://github.com/LazyVim/LazyVim
[snacks]: https://github.com/folke/snacks.nvim
[noice]: https://github.com/folke/noice.nvim
[bufferline]: https://github.com/akinsho/bufferline.nvim
[neo-tree]: https://github.com/nvim-neo-tree/neo-tree.nvim
[which-key]: https://github.com/folke/which-key.nvim
[mason]: https://github.com/williamboman/mason.nvim
[trouble]: https://github.com/folke/trouble.nvim
[todo-comments]: https://github.com/folke/todo-comments.nvim
[flash]: https://github.com/folke/flash.nvim
[blink-cmp]: https://github.com/Saghen/blink.cmp
[render-markdown]: https://github.com/MeanderingProgrammer/render-markdown.nvim
[ibl]: https://github.com/lukas-reineke/indent-blankline.nvim
[rainbow]: https://github.com/HiPhish/rainbow-delimiters.nvim
[gitsigns]: https://github.com/lewis6991/gitsigns.nvim
[gruber-darker-theme]: https://github.com/rexim/gruber-darker-theme
[tokyonight]: https://github.com/folke/tokyonight.nvim
[gruber-darker-vim]: https://github.com/drsooch/gruber-darker-vim
