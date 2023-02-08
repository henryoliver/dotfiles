return {
    -- GoTo Preview
    {
        "rmagatti/goto-preview",
        event = "BufReadPost",
        dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
        -- Mapping
        init = function()
            require("which-key").register({
                ["<Leader>lp"] = { name = "Preview LSP" },
                ["<Leader>lpd"] = {
                    "<Cmd>lua require('goto-preview').goto_preview_definition()<CR>",
                    "Definition Preview",
                },
                ["<Leader>lpt"] = {
                    "<Cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
                    "Type Definition Preview",
                },
                ["<Leader>lpr"] = {
                    "<Cmd>lua require('goto-preview').goto_preview_references()<CR>",
                    "References Preview",
                },
                ["<Leader>lpi"] = {
                    "<Cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
                    "Implementation Preview",
                },
                ["<Leader>lpx"] = { "<Cmd>lua require('goto-preview').close_all_win()<CR>", "Close Windows" },
            })
        end,
    },
}
