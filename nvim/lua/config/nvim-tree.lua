local nonicons_extention = require("nvim-nonicons.extentions.nvim-tree")

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
            glyphs = nonicons_extention.glyphs,
            show = { file = true, folder = true, folder_arrow = true },
        },
    },
})
