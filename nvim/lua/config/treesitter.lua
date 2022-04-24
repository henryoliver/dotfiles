require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-l>",
            scope_incremental = "<C-l>",
            node_incremental = "<C-;>",
            node_decremental = "<C-h>",
        },
    },
    indent = {
        enable = true,
    },
})
