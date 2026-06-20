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

-- Base snacks float groups (brighter border than generic FloatBorder)
M.highlights.normal = Highlight.new("SnacksNormal", { fg = c.fg, bg = c["bg+1"] })
M.highlights.border = Highlight.new("SnacksBorder", { fg = c.niagara, bg = c.none })
M.highlights.normal_nc = Highlight.new("SnacksNormalNC", { fg = c.fg, bg = c.bg })
M.highlights.backdrop = Highlight.new("SnacksBackdrop", { fg = c.fg, bg = c["bg-1"] })

-- Dashboard
M.highlights.dashboard_normal = Highlight.new("SnacksDashboardNormal", { fg = c.fg, bg = c.bg })
M.highlights.dashboard_header = Highlight.new("SnacksDashboardHeader", { fg = c.yellow, bold = opts.bold })
M.highlights.dashboard_title = Highlight.new("SnacksDashboardTitle", { fg = c.yellow, bold = opts.bold })
M.highlights.dashboard_subtitle = Highlight.new("SnacksDashboardSubTitle", { fg = c.niagara })
M.highlights.dashboard_desc = Highlight.new("SnacksDashboardDesc", { fg = c.niagara })
M.highlights.dashboard_key = Highlight.new("SnacksDashboardKey", { fg = c.brown })
M.highlights.dashboard_icon = Highlight.new("SnacksDashboardIcon", { fg = c.brown })
M.highlights.dashboard_footer = Highlight.new("SnacksDashboardFooter", { fg = c.brown, italic = true })
M.highlights.dashboard_special = Highlight.new("SnacksDashboardSpecial", { fg = c.yellow })
M.highlights.dashboard_dir = Highlight.new("SnacksDashboardDir", { fg = c.quartz })

-- Picker
M.highlights.picker_normal = Highlight.new("SnacksPickerNormal", { fg = c.fg, bg = c["bg+1"] })
M.highlights.picker_border = Highlight.new("SnacksPickerBorder", { fg = c.niagara, bg = c.none })
M.highlights.picker_title = Highlight.new("SnacksPickerTitle", { fg = c.white, bold = opts.bold })
M.highlights.picker_match = Highlight.new("SnacksPickerMatch", { fg = c.yellow, bold = opts.bold })
M.highlights.picker_selected = Highlight.new("SnacksPickerSelected", { fg = c["fg+2"], bg = c["bg+2"] })
M.highlights.picker_file = Highlight.new("SnacksPickerFile", { fg = c.fg })
M.highlights.picker_directory = Highlight.new("SnacksPickerDirectory", { fg = c.quartz })
M.highlights.picker_dir = Highlight.new("SnacksPickerDir", { fg = c["niagara-1"] })
M.highlights.picker_path_hidden = Highlight.new("SnacksPickerPathHidden", { fg = c["niagara-1"] })
M.highlights.picker_path_ignored = Highlight.new("SnacksPickerPathIgnored", { fg = c["niagara-1"] })
M.highlights.picker_toggle = Highlight.new("SnacksPickerToggle", { fg = c.yellow })
M.highlights.picker_git_status_untracked = Highlight.new("SnacksPickerGitStatusUntracked", { fg = c.quartz })
M.highlights.picker_git_status_ignored = Highlight.new("SnacksPickerGitStatusIgnored", { fg = c["niagara-1"] })
M.highlights.picker_search = Highlight.new("SnacksPickerSearch", { link = vim_hl.search })
M.highlights.picker_prompt = Highlight.new("SnacksPickerPrompt", { fg = c.yellow, bold = opts.bold })
M.highlights.picker_cursor = Highlight.new("SnacksPickerCursor", { fg = c.yellow })
M.highlights.picker_preview_normal = Highlight.new("SnacksPickerPreviewNormal", { fg = c.fg, bg = c["bg+1"] })
M.highlights.picker_preview_border = Highlight.new("SnacksPickerPreviewBorder", { fg = c.niagara, bg = c.none })
M.highlights.picker_preview_title = Highlight.new("SnacksPickerPreviewTitle", { fg = c.white, bold = opts.bold })
M.highlights.picker_list_normal = Highlight.new("SnacksPickerListNormal", { fg = c.fg, bg = c["bg+1"] })
M.highlights.picker_list_cur_line = Highlight.new("SnacksPickerListCursorLine", { fg = c["fg+2"], bg = c["bg+2"] })

-- Notifier
M.highlights.notifier_normal = Highlight.new("SnacksNotifierNormal", { fg = c.fg, bg = c["bg+1"] })
M.highlights.notifier_border = Highlight.new("SnacksNotifierBorder", { fg = c.niagara, bg = c.none })
M.highlights.notifier_title = Highlight.new("SnacksNotifierTitle", { fg = c["fg+2"], bold = opts.bold })
M.highlights.notifier_footer = Highlight.new("SnacksNotifierFooter", { fg = c.brown, italic = true })
M.highlights.notifier_error = Highlight.new("SnacksNotifierError", { fg = c.red })
M.highlights.notifier_warn = Highlight.new("SnacksNotifierWarn", { fg = c.yellow })
M.highlights.notifier_info = Highlight.new("SnacksNotifierInfo", { fg = c.green })
M.highlights.notifier_debug = Highlight.new("SnacksNotifierDebug", { fg = c.brown })
M.highlights.notifier_hint = Highlight.new("SnacksNotifierHint", { fg = c.quartz })
M.highlights.notifier_icon_error = Highlight.new("SnacksNotifierIconError", { fg = c.red })
M.highlights.notifier_icon_warn = Highlight.new("SnacksNotifierIconWarn", { fg = c.yellow })
M.highlights.notifier_icon_info = Highlight.new("SnacksNotifierIconInfo", { fg = c.green })
M.highlights.notifier_icon_debug = Highlight.new("SnacksNotifierIconDebug", { fg = c.brown })
M.highlights.notifier_icon_hint = Highlight.new("SnacksNotifierIconHint", { fg = c.quartz })
M.highlights.notifier_border_error = Highlight.new("SnacksNotifierBorderError", { fg = c["red-1"] })
M.highlights.notifier_border_warn = Highlight.new("SnacksNotifierBorderWarn", { fg = c.yellow })
M.highlights.notifier_border_info = Highlight.new("SnacksNotifierBorderInfo", { fg = c.niagara })
M.highlights.notifier_border_debug = Highlight.new("SnacksNotifierBorderDebug", { fg = c["bg+4"] })
M.highlights.notifier_border_hint = Highlight.new("SnacksNotifierBorderHint", { fg = c.quartz })
M.highlights.notifier_title_error = Highlight.new("SnacksNotifierTitleError", { fg = c.red, bold = opts.bold })
M.highlights.notifier_title_warn = Highlight.new("SnacksNotifierTitleWarn", { fg = c.yellow, bold = opts.bold })
M.highlights.notifier_title_info = Highlight.new("SnacksNotifierTitleInfo", { fg = c.green, bold = opts.bold })
M.highlights.notifier_title_debug = Highlight.new("SnacksNotifierTitleDebug", { fg = c.brown, bold = opts.bold })
M.highlights.notifier_title_hint = Highlight.new("SnacksNotifierTitleHint", { fg = c.quartz, bold = opts.bold })

-- Indent guides
M.highlights.indent = Highlight.new("SnacksIndent", { fg = c["niagara-2"] })
M.highlights.indent_scope = Highlight.new("SnacksIndentScope", { fg = c["bg+4"] })
M.highlights.indent1 = Highlight.new("SnacksIndent1", { fg = c["red-1"] })
M.highlights.indent2 = Highlight.new("SnacksIndent2", { fg = c.brown })
M.highlights.indent3 = Highlight.new("SnacksIndent3", { fg = c.yellow })
M.highlights.indent4 = Highlight.new("SnacksIndent4", { fg = c.green })
M.highlights.indent5 = Highlight.new("SnacksIndent5", { fg = c.niagara })
M.highlights.indent6 = Highlight.new("SnacksIndent6", { fg = c.niagara })
M.highlights.indent7 = Highlight.new("SnacksIndent7", { fg = c.wisteria })
M.highlights.indent8 = Highlight.new("SnacksIndent8", { fg = c.quartz })

-- Words (highlight word under cursor)
M.highlights.words_match = Highlight.new("SnacksWordsMatch", { fg = c.fg, bg = c["bg+2"] })
M.highlights.words_match_current = Highlight.new("SnacksWordsMatchCurrent", { fg = c.black, bg = c.niagara })

-- Input
M.highlights.input_normal = Highlight.new("SnacksInputNormal", { fg = c.fg, bg = c["bg+1"] })
M.highlights.input_border = Highlight.new("SnacksInputBorder", { fg = c.niagara, bg = c.none })
M.highlights.input_title = Highlight.new("SnacksInputTitle", { fg = c.white, bold = opts.bold })
M.highlights.input_prompt = Highlight.new("SnacksInputPrompt", { fg = c.yellow })

-- Zen / dim
M.highlights.zen_bar = Highlight.new("SnacksZenBar", { fg = c["bg+4"], bg = c.bg })

return M
