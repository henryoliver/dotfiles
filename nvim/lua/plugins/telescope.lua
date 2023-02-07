return {
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        -- event = "UIEnter",
        lazy = false,
        dependencies = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
        },
        config = function()
            local telescope = require("telescope")
            local icons = require("nvim-nonicons")

            telescope.setup({
                defaults = {
                    prompt_prefix = "  " .. icons.get("telescope") .. "  ",
                    selection_caret = " ❯ ",
                    entry_prefix = "   ",
                    layout_config = { prompt_position = "top" },
                    sorting_strategy = "ascending",
                    file_ignore_patterns = { "^cypress/", "package-lock.json" },
                },
                extensions = {
                    fzy_native = {
                        override_generic_sorter = true,
                        override_file_sorter = true,
                    },
                    file_browser = {
                        hijack_netrw = true,
                    },
                },
            })

            -- Plugins
            telescope.load_extension("fzy_native")
            telescope.load_extension("file_browser")
        end,
        -- Mappings
        init = function()
            require("which-key").register({
                ["<Leader>f"] = { name = "Find" },
                -- Words
                ["<Leader>fw"] = { "<Cmd>Telescope live_grep<CR>", "Project Words" },
                ["<Leader>fW"] = { "<Cmd>Telescope grep_string<CR>", "Project Current Word" },
                ["<Leader>fu"] = { "<Cmd>Telescope current_buffer_fuzzy_find<CR>", "Current Buffer Words" },
                -- Files
                ["<Leader>fe"] = { "<Cmd>Telescope file_browser<CR>", "Explore" },
                ["<Leader>ff"] = { "<Cmd>Telescope git_files<CR>", "Git Files" },
                ["<Leader>fF"] = { "<Cmd>Telescope find_files<CR>", "Project Files" },
                -- Others
                ["<Leader>fm"] = { "<Cmd>Telescope marks<CR>", "Marks" },
                ["<Leader>fb"] = { "<Cmd>Telescope buffers<CR>", "Buffers" },
                ["<Leader>fg"] = { "<Cmd>Telescope registers<CR>", "Registers" },
            })
        end,
    },
}
