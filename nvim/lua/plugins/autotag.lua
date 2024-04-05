return {
    -- Autotag
    -- Use treesitter to autoclose and autorename html tag
    {
        "windwp/nvim-ts-autotag",
        lazy = true,
        ft = {
            "html",
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "svelte",
            "vue",
            "tsx",
            "jsx",
        },
        dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
        opts = {
            filetypes = {
                "html",
                "javascript",
                "typescript",
                "javascriptreact",
                "typescriptreact",
                "svelte",
                "vue",
                "tsx",
                "jsx",
            },
        },
    },
}
