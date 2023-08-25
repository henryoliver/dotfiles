return {
    -- Autotag
    {
        "windwp/nvim-ts-autotag",
        lazy = true,
        dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
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
        config = true,
    },
}
