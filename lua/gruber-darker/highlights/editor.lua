local Highlight = require("gruber-darker.highlight")
local c = require("gruber-darker.palette")
local opts = require("gruber-darker.config").get_opts()
local lsp_hl = require("gruber-darker.highlights.lsp").highlights
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

-- trouble.nvim

M.highlights.trouble_normal = Highlight.new("TroubleNormal", { fg = c.fg, bg = c["bg-1"] })
M.highlights.trouble_normal_nc = Highlight.new("TroubleNormalNC", { fg = c.fg, bg = c["bg-1"] })
M.highlights.trouble_text = Highlight.new("TroubleText", { fg = c.fg })
M.highlights.trouble_indent = Highlight.new("TroubleIndent", { fg = c["niagara-2"] })
M.highlights.trouble_indent_fold_closed = Highlight.new("TroubleIndentFoldClosed", { fg = c.brown })
M.highlights.trouble_indent_fold_open = Highlight.new("TroubleIndentFoldOpen", { fg = c.brown })
M.highlights.trouble_pos = Highlight.new("TroublePos", { fg = c.brown })
M.highlights.trouble_count = Highlight.new("TroubleCount", { fg = c.yellow, bold = opts.bold })
M.highlights.trouble_code = Highlight.new("TroubleCode", { fg = c.quartz })
M.highlights.trouble_source = Highlight.new("TroubleSource", { fg = c["niagara-1"] })
M.highlights.trouble_filename = Highlight.new("TroubleFilename", { fg = c.niagara })
M.highlights.trouble_icon_error = Highlight.new("TroubleIconError", { fg = c.red })
M.highlights.trouble_icon_warn = Highlight.new("TroubleIconWarn", { fg = c.yellow })
M.highlights.trouble_icon_info = Highlight.new("TroubleIconInfo", { fg = c.green })
M.highlights.trouble_icon_hint = Highlight.new("TroubleIconHint", { fg = c.quartz })
M.highlights.trouble_preview = Highlight.new("TroublePreview", { link = vim_hl.visual })
M.highlights.trouble_sign_error = Highlight.new("TroubleSignError", { link = lsp_hl.diagnostic_sign_error })
M.highlights.trouble_sign_warn = Highlight.new("TroubleSignWarn", { link = lsp_hl.diagnostic_sign_warn })
M.highlights.trouble_sign_info = Highlight.new("TroubleSignInfo", { link = lsp_hl.diagnostic_sign_info })
M.highlights.trouble_sign_hint = Highlight.new("TroubleSignHint", { link = lsp_hl.diagnostic_sign_hint })

-- todo-comments.nvim

M.highlights.todo_bg_todo = Highlight.new("TodoBgTODO", { fg = c.black, bg = c.yellow, bold = opts.bold })
M.highlights.todo_fg_todo = Highlight.new("TodoFgTODO", { fg = c.yellow })
M.highlights.todo_sign_todo = Highlight.new("TodoSignTODO", { fg = c.yellow })
M.highlights.todo_bg_fixme = Highlight.new("TodoBgFIXME", { fg = c.black, bg = c.red, bold = opts.bold })
M.highlights.todo_fg_fixme = Highlight.new("TodoFgFIXME", { fg = c.red })
M.highlights.todo_sign_fixme = Highlight.new("TodoSignFIXME", { fg = c.red })
M.highlights.todo_bg_hack = Highlight.new("TodoBgHACK", { fg = c.black, bg = c.brown, bold = opts.bold })
M.highlights.todo_fg_hack = Highlight.new("TodoFgHACK", { fg = c.brown })
M.highlights.todo_sign_hack = Highlight.new("TodoSignHACK", { fg = c.brown })
M.highlights.todo_bg_warn = Highlight.new("TodoBgWARN", { fg = c.black, bg = c.brown, bold = opts.bold })
M.highlights.todo_fg_warn = Highlight.new("TodoFgWARN", { fg = c.brown })
M.highlights.todo_sign_warn = Highlight.new("TodoSignWARN", { fg = c.brown })
M.highlights.todo_bg_note = Highlight.new("TodoBgNOTE", { fg = c.black, bg = c.niagara, bold = opts.bold })
M.highlights.todo_fg_note = Highlight.new("TodoFgNOTE", { fg = c.niagara })
M.highlights.todo_sign_note = Highlight.new("TodoSignNOTE", { fg = c.niagara })
M.highlights.todo_bg_perf = Highlight.new("TodoBgPERF", { fg = c.black, bg = c.wisteria, bold = opts.bold })
M.highlights.todo_fg_perf = Highlight.new("TodoFgPERF", { fg = c.wisteria })
M.highlights.todo_sign_perf = Highlight.new("TodoSignPERF", { fg = c.wisteria })
M.highlights.todo_bg_test = Highlight.new("TodoBgTEST", { fg = c.black, bg = c.green, bold = opts.bold })
M.highlights.todo_fg_test = Highlight.new("TodoFgTEST", { fg = c.green })
M.highlights.todo_sign_test = Highlight.new("TodoSignTEST", { fg = c.green })

-- flash.nvim

M.highlights.flash_backdrop = Highlight.new("FlashBackdrop", { fg = c["niagara-1"] })
M.highlights.flash_match = Highlight.new("FlashMatch", { fg = c.yellow, bg = c["bg+2"], bold = opts.bold })
M.highlights.flash_current = Highlight.new("FlashCurrent", { fg = c.black, bg = c.yellow, bold = opts.bold })
M.highlights.flash_label = Highlight.new("FlashLabel", { fg = c.black, bg = c["red+1"], bold = opts.bold })
M.highlights.flash_cursor = Highlight.new("FlashCursor", { link = vim_hl.cursor })
M.highlights.flash_prompt = Highlight.new("FlashPrompt", { fg = c.fg, bg = c["bg+1"] })
M.highlights.flash_prompt_icon = Highlight.new("FlashPromptIcon", { fg = c.yellow })

-- indent-blankline.nvim v3

M.highlights.ibl_indent = Highlight.new("IblIndent", { fg = c["niagara-2"] })
M.highlights.ibl_scope = Highlight.new("IblScope", { fg = c["bg+4"] })
M.highlights.ibl_whitespace = Highlight.new("IblWhitespace", { fg = c["niagara-2"] })
-- v2 backward compatibility
M.highlights.indent_blankline_char = Highlight.new("IndentBlanklineChar", { fg = c["niagara-2"] })
M.highlights.indent_blankline_context_char = Highlight.new("IndentBlanklineContextChar", { fg = c["bg+4"] })

-- blink.cmp

M.highlights.blink_cmp_menu = Highlight.new("BlinkCmpMenu", { link = vim_hl.normal_float })
M.highlights.blink_cmp_menu_border = Highlight.new("BlinkCmpMenuBorder", { fg = c.niagara })
M.highlights.blink_cmp_menu_selection = Highlight.new("BlinkCmpMenuSelection", { fg = c["fg+2"], bg = c["bg+2"] })
M.highlights.blink_cmp_label = Highlight.new("BlinkCmpLabel", { fg = c.fg })
M.highlights.blink_cmp_label_match = Highlight.new("BlinkCmpLabelMatch", { fg = c.yellow, bold = opts.bold })
M.highlights.blink_cmp_label_detail = Highlight.new("BlinkCmpLabelDetail", { fg = c.quartz })
M.highlights.blink_cmp_label_description = Highlight.new("BlinkCmpLabelDescription", { fg = c["niagara-1"] })
M.highlights.blink_cmp_label_deprecated = Highlight.new("BlinkCmpLabelDeprecated", { fg = c["niagara-1"], strikethrough = true })
M.highlights.blink_cmp_kind = Highlight.new("BlinkCmpKind", { fg = c.quartz })
M.highlights.blink_cmp_kind_text = Highlight.new("BlinkCmpKindText", { fg = c.fg })
M.highlights.blink_cmp_kind_method = Highlight.new("BlinkCmpKindMethod", { fg = c.niagara })
M.highlights.blink_cmp_kind_function = Highlight.new("BlinkCmpKindFunction", { fg = c.niagara })
M.highlights.blink_cmp_kind_constructor = Highlight.new("BlinkCmpKindConstructor", { fg = c.niagara })
M.highlights.blink_cmp_kind_field = Highlight.new("BlinkCmpKindField", { fg = c.niagara })
M.highlights.blink_cmp_kind_variable = Highlight.new("BlinkCmpKindVariable", { fg = c["fg+1"] })
M.highlights.blink_cmp_kind_class = Highlight.new("BlinkCmpKindClass", { fg = c.quartz })
M.highlights.blink_cmp_kind_interface = Highlight.new("BlinkCmpKindInterface", { fg = c.quartz })
M.highlights.blink_cmp_kind_module = Highlight.new("BlinkCmpKindModule", { fg = c.quartz })
M.highlights.blink_cmp_kind_property = Highlight.new("BlinkCmpKindProperty", { fg = c.niagara })
M.highlights.blink_cmp_kind_unit = Highlight.new("BlinkCmpKindUnit", { fg = c.wisteria })
M.highlights.blink_cmp_kind_value = Highlight.new("BlinkCmpKindValue", { fg = c.wisteria })
M.highlights.blink_cmp_kind_enum = Highlight.new("BlinkCmpKindEnum", { fg = c.quartz })
M.highlights.blink_cmp_kind_keyword = Highlight.new("BlinkCmpKindKeyword", { fg = c.yellow })
M.highlights.blink_cmp_kind_snippet = Highlight.new("BlinkCmpKindSnippet", { fg = c.green })
M.highlights.blink_cmp_kind_color = Highlight.new("BlinkCmpKindColor", { fg = c.brown })
M.highlights.blink_cmp_kind_file = Highlight.new("BlinkCmpKindFile", { fg = c.fg })
M.highlights.blink_cmp_kind_reference = Highlight.new("BlinkCmpKindReference", { fg = c.wisteria })
M.highlights.blink_cmp_kind_folder = Highlight.new("BlinkCmpKindFolder", { fg = c.brown })
M.highlights.blink_cmp_kind_enum_member = Highlight.new("BlinkCmpKindEnumMember", { fg = c.quartz })
M.highlights.blink_cmp_kind_constant = Highlight.new("BlinkCmpKindConstant", { fg = c.quartz })
M.highlights.blink_cmp_kind_struct = Highlight.new("BlinkCmpKindStruct", { fg = c.quartz })
M.highlights.blink_cmp_kind_event = Highlight.new("BlinkCmpKindEvent", { fg = c.brown })
M.highlights.blink_cmp_kind_operator = Highlight.new("BlinkCmpKindOperator", { fg = c.fg })
M.highlights.blink_cmp_kind_type_parameter = Highlight.new("BlinkCmpKindTypeParameter", { fg = c.quartz })
M.highlights.blink_cmp_doc = Highlight.new("BlinkCmpDoc", { link = vim_hl.normal_float })
M.highlights.blink_cmp_doc_border = Highlight.new("BlinkCmpDocBorder", { fg = c.niagara })
M.highlights.blink_cmp_doc_separator = Highlight.new("BlinkCmpDocSeparator", { fg = c["bg+4"] })
M.highlights.blink_cmp_doc_cur_line = Highlight.new("BlinkCmpDocCursorLine", { bg = c["bg+2"] })
M.highlights.blink_cmp_signature_help = Highlight.new("BlinkCmpSignatureHelp", { link = vim_hl.normal_float })
M.highlights.blink_cmp_signature_help_border = Highlight.new("BlinkCmpSignatureHelpBorder", { fg = c.niagara })
M.highlights.blink_cmp_signature_help_active_parameter = Highlight.new("BlinkCmpSignatureHelpActiveParameter", { fg = c.yellow, bold = opts.bold })
M.highlights.blink_cmp_ghost_text = Highlight.new("BlinkCmpGhostText", { fg = c["niagara-1"] })

-- render-markdown.nvim

M.highlights.render_md_h1 = Highlight.new("RenderMarkdownH1", { fg = c.yellow, bg = c["bg+1"], bold = opts.bold })
M.highlights.render_md_h2 = Highlight.new("RenderMarkdownH2", { fg = c.niagara, bg = c["bg+1"], bold = opts.bold })
M.highlights.render_md_h3 = Highlight.new("RenderMarkdownH3", { fg = c.quartz, bg = c["bg+1"], bold = opts.bold })
M.highlights.render_md_h4 = Highlight.new("RenderMarkdownH4", { fg = c.green, bg = c["bg+1"], bold = opts.bold })
M.highlights.render_md_h5 = Highlight.new("RenderMarkdownH5", { fg = c.wisteria, bg = c["bg+1"], bold = opts.bold })
M.highlights.render_md_h6 = Highlight.new("RenderMarkdownH6", { fg = c.brown, bg = c["bg+1"], bold = opts.bold })
M.highlights.render_md_h1_bg = Highlight.new("RenderMarkdownH1Bg", { bg = c["bg+1"] })
M.highlights.render_md_h2_bg = Highlight.new("RenderMarkdownH2Bg", { bg = c["bg+1"] })
M.highlights.render_md_h3_bg = Highlight.new("RenderMarkdownH3Bg", { bg = c["bg+1"] })
M.highlights.render_md_h4_bg = Highlight.new("RenderMarkdownH4Bg", { bg = c["bg+1"] })
M.highlights.render_md_h5_bg = Highlight.new("RenderMarkdownH5Bg", { bg = c["bg+1"] })
M.highlights.render_md_h6_bg = Highlight.new("RenderMarkdownH6Bg", { bg = c["bg+1"] })
M.highlights.render_md_code = Highlight.new("RenderMarkdownCode", { bg = c["bg+1"] })
M.highlights.render_md_code_inline = Highlight.new("RenderMarkdownCodeInline", { fg = c.green })
M.highlights.render_md_bullet = Highlight.new("RenderMarkdownBullet", { fg = c.brown })
M.highlights.render_md_link = Highlight.new("RenderMarkdownLink", { fg = c.niagara, underline = true })
M.highlights.render_md_table_head = Highlight.new("RenderMarkdownTableHead", { fg = c.yellow, bold = opts.bold })
M.highlights.render_md_table_row = Highlight.new("RenderMarkdownTableRow", { fg = c.fg })
M.highlights.render_md_table_fill = Highlight.new("RenderMarkdownTableFill", { fg = c["niagara-2"] })
M.highlights.render_md_quote = Highlight.new("RenderMarkdownQuote", { fg = c.brown, italic = true })
M.highlights.render_md_dash = Highlight.new("RenderMarkdownDash", { fg = c.brown })
M.highlights.render_md_checked = Highlight.new("RenderMarkdownChecked", { fg = c.green })
M.highlights.render_md_unchecked = Highlight.new("RenderMarkdownUnchecked", { fg = c["niagara-1"] })
M.highlights.render_md_sign = Highlight.new("RenderMarkdownSign", { fg = c.brown, bg = c["bg-1"] })

return M
