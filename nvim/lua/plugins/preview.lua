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
                d = { preview.goto_preview_definition, "Definition Preview" },
                t = { preview.goto_preview_type_definition, "Type Definition Preview" },
                r = { preview.goto_preview_references, "References Preview" },
                i = { preview.goto_preview_implementation, "Implementation Preview" },
                x = { preview.close_all_win, "Close Windows" }
            },
            { prefix = "<leader>", mode = "n" }
        })
    end
}
