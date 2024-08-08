return {
    -- GoTo Preview
    -- A small Neovim plugin for previewing native LSP's goto definition, type definition, implementation, declaration and references calls in floating windows.
    "rmagatti/goto-preview",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
    opts = {
        default_mappings = false,
    },
    init = function()
        -- Mappings
        local wk = require("which-key")
        local preview = require("goto-preview")

        wk.add({
            { "<leader>p", group = "Preview" },
            { "<leader>pd", preview.goto_preview_definition, desc = "Definition" },
            { "<leader>pi", preview.goto_preview_type_definition, desc = "Implementation" },
            { "<leader>pr", preview.goto_preview_references, desc = "References" },
            { "<leader>pt", preview.goto_preview_implementation, desc = "Type Definition" },
        })
    end,
}
