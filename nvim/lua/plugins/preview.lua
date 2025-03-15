return {
    ---@type LazySpec
    "rmagatti/goto-preview",
    dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
    opts = {
        default_mappings = false,
        opacity = 10, -- 0-100 opacity level of the floating window where 100 is fully transparent.
        focus_on_open = false, -- Focus the floating window when opening it.
        dismiss_on_move = true, -- Dismiss the floating window when moving the cursor.
        stack_floating_preview_windows = false, -- Whether to nest floating windows
    },
    keys = {
        {
            "<Leader>pd",
            function()
                return require("goto-preview").goto_preview_definition()
            end,
            desc = "Definition",
        },
        {
            "<Leader>pi",
            function()
                return require("goto-preview").goto_preview_type_definition()
            end,
            desc = "Type Definition",
        },
        {
            "<Leader>pr",
            function()
                return require("goto-preview").goto_preview_references()
            end,
            desc = "References",
        },
        {
            "<Leader>pt",
            function()
                return require("goto-preview").goto_preview_implementation()
            end,
            desc = "Implementation",
        },
    },
}
