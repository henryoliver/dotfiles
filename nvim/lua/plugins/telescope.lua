return {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "yamatsum/nvim-nonicons",
        "debugloop/telescope-undo.nvim",
        "nvim-telescope/telescope-fzy-native.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local telescope_actions = require("telescope.actions")

        local nonicons = require("nvim-nonicons")
        local colors = require("nord.colors").palette

        telescope.setup({
            defaults = {
                prompt_prefix = "  " .. nonicons.get("telescope") .. "  ",
                selection_caret = " " .. nonicons.get("chevron-right") .. " ",
                entry_prefix = "   ",
                layout_config = {
                    width = 0.8,
                    prompt_position = "top",
                    preview_width = 0.5,
                },
                sorting_strategy = "ascending",
                file_ignore_patterns = { "^%.git/", "package-lock.json" },
                mappings = {
                    i = {
                        -- Paste from system clipboard
                        ["<C-v>"] = telescope_actions.paste_register,
                    },
                    n = {
                        ["<C-n>"] = telescope_actions.cycle_history_next,
                        ["<C-p>"] = telescope_actions.cycle_history_prev,
                    },
                },
            },
            pickers = {
                colorscheme = {
                    enable_preview = true,
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
                    dir_icon = nonicons.get("file-directory"),
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

        -- Auto Commands
        -- Disable folding in Telescope preview
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "TelescopeResults",
            callback = function()
                vim.opt_local.foldenable = false
            end,
        })

        -- Also disable folding in the preview buffer
        vim.api.nvim_create_autocmd("User", {
            pattern = "TelescopePreviewerLoaded",
            callback = function()
                vim.opt_local.foldenable = false
            end,
        })
    end,
    keys = {
        -- Explore Browser
        { "<Leader>e", "<Cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", desc = "Explore" },
        -- Buffers
        { "<Leader>b", "<Cmd>Telescope buffers sort_mru=true<CR>", desc = "Buffers" },
        -- Search: Words
        { "<Leader>sw", "<Cmd>Telescope live_grep<CR>", desc = "Project Words" },
        { "<Leader>sW", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Current Buffer Words" },
        -- Find: Files
        { "<Leader>sf", "<Cmd>Telescope git_files<CR>", desc = "Git Files" },
        { "<Leader>sF", "<Cmd>Telescope find_files<CR>", desc = "Project Files" },
        -- Find: Git
        { "<Leader>sg", "<Cmd>Telescope git_bcommits<CR>", desc = "Git Buffer Commits" },
        -- Find: Others
        { "<Leader>sm", "<Cmd>Telescope marks<CR>", desc = "Marks" },
        { "<Leader>sr", "<Cmd>Telescope registers<CR>", desc = "Registers" },
        { "<Leader>su", "<Cmd>Telescope undo<CR>", desc = "Undo" },
    },
}
