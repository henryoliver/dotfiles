local spec = {
	"NvChad/nvterm",
	keys = "<leader>t"
}

function spec:init()
	local nvterm = require("nvterm")
	local terminal = require("nvterm.terminal")

    -- Mappings
    vim.keymap.set({ "n", "t" }, "<leader>t", function() terminal.toggle('horizontal') end, { desc = "Terminal" })
end

function spec:config()
	local nvterm = require("nvterm")

	nvterm.setup({})
end

return spec
