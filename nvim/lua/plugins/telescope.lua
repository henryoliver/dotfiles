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
                color_devicons = true
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
        vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.polar_night.brightest_bright })
        vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.polar_night.brightest_bright })
        vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = colors.polar_night.brightest_bright })
        vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = colors.polar_night.brightest_bright })
    end,
    init = function()
        -- Mappings
        local wk = require("which-key")

        wk.register({
            -- Explore Browser
            e = { ":Telescope file_browser path=%:p:h select_buffer=true<cr>", "Explore" },
            -- Buffers
            b = { ":Telescope buffers sort_mru=true<cr>", "Buffers" },
            s = {
                name = "Search",
                -- Words
                w = { ":Telescope live_grep<cr>", "Project Words" },
                W = { ":Telescope current_buffer_fuzzy_find<cr>", "Current Buffer Words" },
                -- Files
                f = { ":Telescope git_files<cr>", "Git Files" },
                F = { ":Telescope find_files<cr>", "Project Files" },
                -- Others
                u = { ":Telescope undo<cr>", "Undo" },
                m = { ":Telescope marks<cr>", "Marks" },
                r = { ":Telescope registers<cr>", "Registers" },
                -- LSP
                d = { ":Telescope diagnostics<cr>", "LSP Diagnostics" },
                -- Git
                g = { ":Telescope git_bcommits<cr>", "Git Buffer Commits" },
            },
        }, { prefix = "<leader>", mode = "n" })
    end
}
