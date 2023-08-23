return {
    -- GoTo Preview
    "rmagatti/goto-preview",
    lazy = true,
    event = "BufReadPre",
    dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
    opts = {
        default_mappings = false,
    },
    init = function()
        local preview = require("goto-preview")

        -- Mappings
        vim.keymap.set("n", "<leader>pd", preview.goto_preview_definition, { desc = "Definition Preview" })
        vim.keymap.set("n", "<leader>pt", preview.goto_preview_type_definition, { desc = "Type Definition Preview" })
        vim.keymap.set("n", "<leader>pr", preview.goto_preview_references, { desc = "References Preview" })
        vim.keymap.set("n", "<leader>pi", preview.goto_preview_implementation, { desc = "Implementation Preview" })
        vim.keymap.set("n", "<leader>px", preview.close_all_win, { desc = "Close Windows" })
    end
}
