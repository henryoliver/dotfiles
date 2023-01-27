require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    auto_install = true,

    highlight = { enable = true },
    indent = { enable = true },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-l>",
            scope_incremental = "<C-l>",
            node_incremental = false,
            node_decremental = false,
        },
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
})
