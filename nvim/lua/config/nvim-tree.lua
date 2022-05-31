require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_directories = {
        enable = true,
        auto_open = false,
    },
    renderer = {
        highlight_git = true,
        icons = {
            show = { file = true, folder = true, folder_arrow = true },
        },
    },
})
