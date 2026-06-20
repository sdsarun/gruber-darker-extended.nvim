local Highlight = require("gruber-darker.highlight")
local c = require("gruber-darker.palette")
local vim_hl = require("gruber-darker.highlights.vim").highlights

---@type HighlightsProvider
local M = {
	highlights = {},
}

---Set `gitsigns.nvim` plugin highlights
function M.setup()
	for _, value in pairs(M.highlights) do
		value:setup()
	end
end

-- Sign column
M.highlights.add = Highlight.new("GitSignsAdd", { link = vim_hl.diff_add })
M.highlights.change = Highlight.new("GitSignsChange", { link = vim_hl.diff_change })
M.highlights.delete = Highlight.new("GitSignsDelete", { link = vim_hl.diff_delete })

-- Number column (config.numhl)
M.highlights.add_nr = Highlight.new("GitSignsAddNr", { link = vim_hl.diff_add })
M.highlights.change_nr = Highlight.new("GitSignsChangeNr", { link = vim_hl.diff_change })
M.highlights.delete_nr = Highlight.new("GitSignsDeleteNr", { link = vim_hl.diff_delete })

-- Full line highlight (config.linehl)
M.highlights.add_ln = Highlight.new("GitSignsAddLn", { fg = c.green, bg = c["bg+1"] })
M.highlights.change_ln = Highlight.new("GitSignsChangeLn", { fg = c.yellow, bg = c["bg+1"] })
M.highlights.delete_ln = Highlight.new("GitSignsDeleteLn", { fg = c["red+1"], bg = c["bg+1"] })

-- Cursorline variant (config.culhl)
M.highlights.add_cul = Highlight.new("GitSignsAddCul", { fg = c.green, bg = c["bg+2"] })
M.highlights.change_cul = Highlight.new("GitSignsChangeCul", { fg = c.yellow, bg = c["bg+2"] })
M.highlights.delete_cul = Highlight.new("GitSignsDeleteCul", { fg = c["red+1"], bg = c["bg+2"] })

-- Virtual line shown for deleted lines
M.highlights.delete_virt_ln = Highlight.new("GitSignsDeleteVirtLn", { fg = c["red+1"], bg = c["bg+1"] })

-- Current line blame (config.current_line_blame)
M.highlights.current_line_blame = Highlight.new("GitSignsCurrentLineBlame", { fg = c["niagara-1"], italic = true })

-- Inline word diff (config.word_diff)
M.highlights.add_inline = Highlight.new("GitSignsAddInline", { fg = c.green, bg = c["bg+2"] })
M.highlights.change_inline = Highlight.new("GitSignsChangeInline", { fg = c.yellow, bg = c["bg+2"] })
M.highlights.delete_inline = Highlight.new("GitSignsDeleteInline", { fg = c["red+1"], bg = c["bg+2"] })

M.highlights.add_ln_inline = Highlight.new("GitSignsAddLnInline", { link = M.highlights.add_inline })
M.highlights.change_ln_inline = Highlight.new("GitSignsChangeLnInline", { link = M.highlights.change_inline })
M.highlights.delete_ln_inline = Highlight.new("GitSignsDeleteLnInline", { link = M.highlights.delete_inline })

M.highlights.add_virt_ln_inline = Highlight.new("GitSignsAddVirtLnInline", { link = M.highlights.add_inline })
M.highlights.change_virt_ln_inline = Highlight.new("GitSignsChangeVirtLnInline", { link = M.highlights.change_inline })
M.highlights.delete_virt_ln_inline = Highlight.new("GitSignsDeleteVirtLnInline", { link = M.highlights.delete_inline })

return M
