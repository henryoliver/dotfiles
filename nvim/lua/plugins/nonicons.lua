local spec = {
	"yamatsum/nvim-nonicons",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = "nvim-tree/nvim-web-devicons"
}

function spec:config()
	local nonicons = require("nvim-nonicons")

	nonicons.setup({})
end

return spec
