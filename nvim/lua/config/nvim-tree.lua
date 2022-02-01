vim.g.nvim_tree_show_icons = { git = 1, folders = 1, files = 1, folder_arrows = 1 }

require('nvim-tree').setup({
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    update_to_buf_dir = {
        enable = true,
        auto_open = false,
    },
})
