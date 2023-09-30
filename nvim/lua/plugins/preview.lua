return {
    -- GoTo Preview
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

        wk.register({
            p = {
                name = "Preview",
                d = { preview.goto_preview_definition, "Definition" },
                t = { preview.goto_preview_type_definition, "Type Definition" },
                r = { preview.goto_preview_references, "References" },
                i = { preview.goto_preview_implementation, "Implementation" },
            },
        }, { prefix = "<leader>", mode = "n" })
    end,
}
