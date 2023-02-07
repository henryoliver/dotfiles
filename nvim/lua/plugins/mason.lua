return {
    -- Mason
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "jose-elias-alvarez/null-ls.nvim",
            "jayp0521/mason-null-ls.nvim",
        },
        config = true,
        -- Mapping
        init = function()
            require("which-key").register({ ["<Leader>m"] = { "<Cmd>Mason<CR>", "Mason" } })
        end,
    },
}
