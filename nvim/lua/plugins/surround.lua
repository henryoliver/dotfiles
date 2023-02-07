return {
    -- Surround
    {
        "ur4ltz/surround.nvim",
        event = "BufReadPost",
        opts = {
            load_keymaps = false,
            map_insert_mode = false,
            space_on_closing_char = true,
        },
        -- Mappings
        init = function()
            require("which-key").register({
                ["<Leader>s"] = { name = "Surround" },
                ["<Leader>sa"] = { "<Plug>SurroundAddNormal", "Add" },
                ["<Leader>sd"] = { "<Plug>SurroundDelete", "Delete" },
                ["<Leader>sr"] = { "<Plug>SurroundReplace", "Replace" },
                ["<Leader>st"] = { "<Plug>SurroundToggleQuotes", "Toggle Quotes" },
            })

            require("which-key").register({
                ["<Leader>s"] = { name = "Surround" },
                ["<Leader>sa"] = { "<Plug>SurroundAddVisual", "Add" },
            }, { mode = "v" })
        end,
    },
}
