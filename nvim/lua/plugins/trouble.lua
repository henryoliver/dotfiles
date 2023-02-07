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
                ["<Leader>o"] = { name = "Trouble" },
                ["<Leader>ot"] = { "<Cmd>TroubleToggle<CR>", "Toggle" },
                ["<Leader>oT"] = { "<Cmd>TodoTrouble<CR>", "Todos" },
                ["<Leader>or"] = { "<Cmd>TroubleToggle lsp_references<CR>", "References LSP" },
                ["<Leader>od"] = { "<Cmd>TroubleToggle document_diagnostics<CR>", "Document LSP" },
                ["<Leader>ow"] = { "<Cmd>TroubleToggle workspace_diagnostics<CR>", "Workspace LSP" },
            })
        end,
    },
}
