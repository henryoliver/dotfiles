return {
    -- Surround
    {
        "ur4ltz/surround.nvim",
        event = "BufReadPost",
        dependencies = "tpope/vim-repeat",
        opts = {
            load_keymaps = false,
            map_insert_mode = false,
            space_on_closing_char = true,
        },
        -- Mappings
        init = function()
            require("which-key").register({
                ["s"] = { name = "Surround" },
                ["sa"] = { "<Plug>SurroundAddNormal", "Add" },
                ["sd"] = { "<Plug>SurroundDelete", "Delete" },
                ["sr"] = { "<Plug>SurroundReplace", "Replace" },
                ["st"] = { "<Plug>SurroundToggleQuotes", "Toggle Quotes" },
            })

            require("which-key").register({
                ["s"] = { name = "Surround" },
                ["sa"] = { "<Plug>SurroundAddVisual", "Add" },
            }, { mode = "v" })
        end,
    },
}
