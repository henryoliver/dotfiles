return {
    -- Telescope
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "yamatsum/nvim-nonicons",
        "debugloop/telescope-undo.nvim",
        "nvim-telescope/telescope-fzy-native.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local telescope_actions = require("telescope.actions")

        local icons = require("nvim-nonicons")
        local colors = require("nord.colors").palette

        telescope.setup({
            defaults = {
                prompt_prefix = "  " .. icons.get("telescope") .. "  ",
                selection_caret = " ❯ ",
                entry_prefix = "   ",
                layout_config = { prompt_position = "top", preview_width = 0.6 },
                sorting_strategy = "ascending",
                file_ignore_patterns = { "^%.git/", "^cypress/", "package-lock.json" },
                color_devicons = true,
                mappings = {
                    n = {
                        ["<C-n>"] = telescope_actions.cycle_history_next,
                        ["<C-p>"] = telescope_actions.cycle_history_prev,
                    },
                },
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

        -- Highlights
        vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = colors.none, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = colors.frost.artic_water })
        vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.polar_night.brightest })
        vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.polar_night.brightest })
        vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = colors.polar_night.brightest })
        vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = colors.polar_night.brightest })
    end,
    init = function()
        -- Mappings
        local wk = require("which-key")

        wk.add({
            mode = { "n", "v" },
            -- Explore Browser
            { "<leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "Explore" },
            -- Buffers
            { "<leader>b", ":Telescope buffers sort_mru=true<cr>", desc = "Buffers" },
            { "<leader>s", group = "Search" },
            -- Words
            { "<leader>sw", ":Telescope live_grep<cr>", desc = "Project Words" },
            { "<leader>sW", ":Telescope current_buffer_fuzzy_find<cr>", desc = "Current Buffer Words" },
            -- Files
            { "<leader>sF", ":Telescope find_files<cr>", desc = "Project Files" },
            { "<leader>sf", ":Telescope git_files<cr>", desc = "Git Files" },
            -- Git
            { "<leader>sg", ":Telescope git_bcommits<cr>", desc = "Git Buffer Commits" },
            -- Others
            { "<leader>sm", ":Telescope marks<cr>", desc = "Marks" },
            { "<leader>sr", ":Telescope registers<cr>", desc = "Registers" },
            { "<leader>su", ":Telescope undo<cr>", desc = "Undo" },
        })

        -- Disable folding in Telescope's result window.
        vim.api.nvim_create_autocmd(
            "FileType",
            { pattern = "TelescopeResults", command = "setlocal foldlevelstart=999" }
        )
    end,
}
