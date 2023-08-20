local spec = {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}

function spec:init()
    local notify = require("notify")
    local colors = require("nord.colors")
    local nonicons_extention = require("nvim-nonicons.extentions.nvim-notify")

    notify.setup({ 
       background_colour  = colors.nord6_gui,
       icons = nonicons_extention.icons,
    })
end

function spec:config()
	local noice = require("noice")

	noice.setup({
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = true,
		},
	})
end

return spec
