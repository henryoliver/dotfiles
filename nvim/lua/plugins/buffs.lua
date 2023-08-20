local spec = {
	"j-morano/buffer_manager.nvim",
	keys = "<leader>b",
	dependencies = "nvim-lua/plenary.nvim",
}

function spec:config()
    local bfs = require("buffer_manager")
    local bfs_ui = require("buffer_manager.ui")

    bfs.setup({})

    -- Mappings
    vim.keymap.set("n", "<leader>b", bfs_ui.toggle_quick_menu, { desc ="Buffers" })
end

return spec
