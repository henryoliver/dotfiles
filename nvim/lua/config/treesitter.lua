require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-l>",
            scope_incremental = false,
            node_incremental = false,
            node_decremental = false,
        },
    },
    indent = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
})
