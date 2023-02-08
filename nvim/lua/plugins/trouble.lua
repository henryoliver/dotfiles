local icons = require("util/icons")

return {
    -- Trouble
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        dependencies = { "neovim/nvim-lspconfig", "nvim-tree/nvim-web-devicons" },
        opts = {
            signs = {
                error = icons.error,
                warning = icons.warning,
                hint = icons.hint,
                information = icons.information,
                other = icons.other,
            },
        },
        -- Mapping
        init = function()
            require("which-key").register({
                ["<Leader>lt"] = { name = "Trouble" },
                ["<Leader>ltt"] = { "<Cmd>TroubleToggle<CR>", "Toggle" },
                ["<Leader>ltT"] = { "<Cmd>TodoTrouble<CR>", "Todos" },
                ["<Leader>ltr"] = { "<Cmd>TroubleToggle lsp_references<CR>", "References LSP" },
                ["<Leader>ltd"] = { "<Cmd>TroubleToggle document_diagnostics<CR>", "Document LSP" },
                ["<Leader>ltw"] = { "<Cmd>TroubleToggle workspace_diagnostics<CR>", "Workspace LSP" },
            })
        end,
    },
}
