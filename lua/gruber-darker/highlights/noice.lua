local Highlight = require("gruber-darker.highlight")
local c = require("gruber-darker.palette")
local opts = require("gruber-darker.config").get_opts()
local vim_hl = require("gruber-darker.highlights.vim").highlights

---@type HighlightsProvider
local M = {
	highlights = {},
}

function M.setup()
	for _, value in pairs(M.highlights) do
		value:setup()
	end
end

-- Cmdline popup
M.highlights.cmdline = Highlight.new("NoiceCmdline", { fg = c.fg, bg = c["bg+1"] })
M.highlights.cmdline_icon = Highlight.new("NoiceCmdlineIcon", { fg = c.niagara })
M.highlights.cmdline_icon_search = Highlight.new("NoiceCmdlineIconSearch", { fg = c.yellow })
M.highlights.cmdline_popup = Highlight.new("NoiceCmdlinePopup", { fg = c.fg, bg = c["bg+1"] })
M.highlights.cmdline_popup_border = Highlight.new("NoiceCmdlinePopupBorder", { fg = c.niagara })
M.highlights.cmdline_popup_border_search = Highlight.new("NoiceCmdlinePopupBorderSearch", { fg = c.yellow })
M.highlights.cmdline_popup_title = Highlight.new("NoiceCmdlinePopupTitle", { fg = c.white, bold = opts.bold })

-- Popup / confirm
M.highlights.popup = Highlight.new("NoicePopup", { link = vim_hl.normal_float })
M.highlights.popup_border = Highlight.new("NoicePopupBorder", { fg = c.niagara })
M.highlights.confirm = Highlight.new("NoiceConfirm", { link = vim_hl.normal_float })
M.highlights.confirm_border = Highlight.new("NoiceConfirmBorder", { fg = c.yellow })
M.highlights.split_border = Highlight.new("NoiceSplitBorder", { fg = c.niagara })

-- Scrollbar
M.highlights.scrollbar = Highlight.new("NoiceScrollbar", { bg = c["bg+2"] })
M.highlights.scrollbar_thumb = Highlight.new("NoiceScrollbarThumb", { bg = c["bg+4"] })

-- Mini notifications (bottom-right inline messages)
M.highlights.mini = Highlight.new("NoiceMini", { fg = c.fg, bg = c["bg+1"] })
M.highlights.mini_title = Highlight.new("NoiceMiniTitle", { fg = c.brown, italic = true })

-- Virtual text and LSP progress
M.highlights.virtual_text = Highlight.new("NoiceVirtualText", { fg = c.brown })
M.highlights.lsp_progress_title = Highlight.new("NoiceLspProgressTitle", { fg = c.niagara })
M.highlights.lsp_progress_client = Highlight.new("NoiceLspProgressClient", { fg = c.quartz })
M.highlights.lsp_progress_spinner = Highlight.new("NoiceLspProgressSpinner", { fg = c.yellow })

-- Format tokens
M.highlights.format_progress_done = Highlight.new("NoiceFormatProgressDone", { fg = c.green, bold = opts.bold })
M.highlights.format_progress_todo = Highlight.new("NoiceFormatProgressTodo", { fg = c.brown })
M.highlights.format_event = Highlight.new("NoiceFormatEvent", { fg = c.brown })
M.highlights.format_kind = Highlight.new("NoiceFormatKind", { fg = c.niagara })
M.highlights.format_date = Highlight.new("NoiceFormatDate", { fg = c.quartz })
M.highlights.format_confirm = Highlight.new("NoiceFormatConfirm", { fg = c.yellow })
M.highlights.format_confirm_default = Highlight.new("NoiceFormatConfirmDefault", { fg = c.yellow, bold = opts.bold })
M.highlights.format_title = Highlight.new("NoiceFormatTitle", { fg = c.white, bold = opts.bold })
M.highlights.format_level = Highlight.new("NoiceFormatLevel", { fg = c.quartz })

-- Message area
M.highlights.msg_area = Highlight.new("NoiceMsgArea", { fg = c.fg, bg = c.bg })
M.highlights.msg_separator = Highlight.new("NoiceMsgSeparator", { fg = c["bg+4"] })

return M
