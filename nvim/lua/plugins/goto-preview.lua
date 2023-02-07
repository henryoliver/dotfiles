return {
    -- GoTo Preview
    {
        "rmagatti/goto-preview",
        event = "BufReadPost",
        dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
        -- Mapping
        init = function()
            require("which-key").register({
                ["<Leader>p"] = { name = "Preview LSP" },
                ["<Leader>pd"] = {
                    "<Cmd>lua require('goto-preview').goto_preview_definition()<CR>",
                    "Definition Preview",
                },
                ["<Leader>pt"] = {
                    "<Cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
                    "Type Definition Preview",
                },
                ["<Leader>pr"] = {
                    "<Cmd>lua require('goto-preview').goto_preview_references()<CR>",
                    "References Preview",
                },
                ["<Leader>pi"] = {
                    "<Cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
                    "Implementation Preview",
                },
                ["<Leader>px"] = { "<Cmd>lua require('goto-preview').close_all_win()<CR>", "Close Windows" },
            })
        end,
    },
}
