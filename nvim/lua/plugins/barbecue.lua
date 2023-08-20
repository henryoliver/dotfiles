local spec = {
	"utilyre/barbecue.nvim",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = "SmiteshP/nvim-navic",
}

function spec:config()
	local barbecue = require("barbecue")
    local icons = require("config.icons")

	barbecue.setup({
		show_modified = true,
		kinds = icons.kind,
		symbols = {
			separator = icons.widget.nesting,
		},
	})
end

return spec
