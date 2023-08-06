return {
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim",
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
                    undo = {
                        -- telescope-undo.nvim config, see below
                    },
                    fzy_native = {
                        override_generic_sorter = true,
                        override_file_sorter = true,
                    },
                    file_browser = {
                        hidden = true,
                        grouped = true,
                        hijack_netrw = true,
                        respect_gitignore = false,
                    },
                },
            })

            -- Plugins
            telescope.load_extension("undo")
            telescope.load_extension("fzy_native")
            telescope.load_extension("file_browser")
        end,
        -- Mappings
        init = function()
            require("which-key").register({
                -- Explore Browser
                ["<Leader>e"] = { "<Cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", "Explore" },
                --
                ["<Leader>s"] = { name = "Search" },
                -- Words
                ["<Leader>sw"] = { "<Cmd>Telescope live_grep<CR>", "Project Words" },
                ["<Leader>sW"] = { "<Cmd>Telescope grep_string<CR>", "Project Current Word" },
                ["<Leader>su"] = { "<Cmd>Telescope current_buffer_fuzzy_find<CR>", "Current Buffer Words" },
                -- Files
                ["<Leader>sf"] = { "<Cmd>Telescope git_files<CR>", "Git Files" },
                ["<Leader>sF"] = { "<Cmd>Telescope find_files<CR>", "Project Files" },
                -- Others
                ["<Leader>su"] = { "<Cmd>Telescope undo<CR>", "Undo" },
                ["<Leader>sm"] = { "<Cmd>Telescope marks<CR>", "Marks" },
                ["<Leader>sb"] = { "<Cmd>Telescope buffers<CR>", "Buffers" },
                ["<Leader>sg"] = { "<Cmd>Telescope registers<CR>", "Registers" },
            })
        end,
    },
}
