return {
    -- PineScript support - uses JavaScript treesitter for syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            return opts
        end,
        init = function()
            -- Register .pine files as pinescript filetype
            vim.filetype.add({
                extension = {
                    pine = "pinescript",
                    psl = "pinescript",
                },
            })

            -- Use JavaScript treesitter for PineScript syntax
            vim.treesitter.language.register("javascript", "pinescript")
        end,
    },
}
