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
                    layout_config = { prompt_position = "top", preview_width = 0.6 },
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
            -- https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions#different-plugins-with-telescope-integration
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
                ["<Leader>sW"] = { "<Cmd>Telescope current_buffer_fuzzy_find<CR>", "Current Buffer Words" },
                -- Files
                ["<Leader>sf"] = { "<Cmd>Telescope git_files<CR>", "Git Files" },
                ["<Leader>sF"] = { "<Cmd>Telescope find_files<CR>", "Project Files" },
                -- Others
                ["<Leader>su"] = { "<Cmd>Telescope undo<CR>", "Undo" },
                ["<Leader>sm"] = { "<Cmd>Telescope marks<CR>", "Marks" },
                ["<Leader>sb"] = { "<Cmd>Telescope buffers<CR>", "Buffers" },
                ["<Leader>sr"] = { "<Cmd>Telescope registers<CR>", "Registers" },

                -- LSP
                ["<Leader>sd"] = { "<Cmd>Telescope diagnostics<CR>", "LSP Diagnostics" },

                -- Git
                ["<Leader>sg"] = { "<Cmd>Telescope git_bcommits<CR>", "Git Buffer Commits" },
            })

            require("which-key").register({
                -- Git
                ["<Leader>s"] = { name = "Find" },
                ["<Leader>sg"] = { "<Cmd>Telescope git_bcommits_range<CR>", "Git Commits by Range" },
            }, { mode = "v" })
        end,
    },
}
