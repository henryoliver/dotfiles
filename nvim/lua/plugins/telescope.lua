return {
    -- Telescope
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim",
        "nvim-telescope/telescope-fzy-native.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
        local telescope = require("telescope")

        local colors = require("nord.colors")
        local icons = require("nvim-nonicons")

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
        vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = colors.none, bg = colors.nord1_gui })
        vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = colors.nord9_gui })

        vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.nord3_gui_bright })
        vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.nord3_gui_bright })
        vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = colors.nord3_gui_bright })
        vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = colors.nord3_gui_bright })
    end,
    init = function()
        -- Mappings
        -- Explore Browser
        vim.keymap.set("n", "<leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<cr>",
            { desc = "Explore" })
        -- Words
        vim.keymap.set("n", "<leader>sw", ":Telescope live_grep<cr>", { desc = "Project Words" })
        vim.keymap.set("n", "<leader>sW", ":Telescope current_buffer_fuzzy_find<cr>", { desc = "Current Buffer Words" })
        -- Files
        vim.keymap.set("n", "<leader>sf", ":Telescope git_files<cr>", { desc = "Git Files" })
        vim.keymap.set("n", "<leader>sF", ":Telescope find_files<cr>", { desc = "Project Files" })
        -- Others
        vim.keymap.set("n", "<leader>su", ":Telescope undo<cr>", { desc = "Undo" })
        vim.keymap.set("n", "<leader>sm", ":Telescope marks<cr>", { desc = "Marks" })
        vim.keymap.set("n", "<leader>sb", ":Telescope buffers<cr>", { desc = "Buffers" })
        vim.keymap.set("n", "<leader>sr", ":Telescope registers<cr>", { desc = "Registers" })
        -- LSP
        vim.keymap.set("n", "<leader>sd", ":Telescope diagnostics<cr>", { desc = "LSP Diagnostics" })
        -- Git
        vim.keymap.set("n", "<leader>sg", ":Telescope git_bcommits<cr>", { desc = "Git Buffer Commits" })
        vim.keymap.set("v", "<leader>sg", ":Telescope git_bcommits_range<cr>", { desc = "Git Commits by Range" })
    end
}
