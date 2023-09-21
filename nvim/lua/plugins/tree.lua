return {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    dependencies = "yamatsum/nvim-nonicons",
    config = function()
        local nvim_tree = require("nvim-tree")

        local colors = require("nord.colors").palette
        local nonicons_extention = require("nvim-nonicons.extentions.nvim-tree")

        nvim_tree.setup({
            filters = {
                dotfiles = true,
                custom = { "^\\.git$" },
            },
            disable_netrw = true,
            hijack_netrw = true,
            prefer_startup_root = true,
            hijack_cursor = true,
            hijack_unnamed_buffer_when_opening = false,
            sync_root_with_cwd = false,
            hijack_directories = {
                enable = true,
                auto_open = false,
            },
            update_focused_file = {
                enable = true,
                update_cwd = false,
            },
            view = {
                adaptive_size = false,
                side = "left",
                width = 30,
                hide_root_folder = false,
            },
            git = {
                enable = true,
                ignore = false,
            },
            filesystem_watchers = {
                enable = true,
            },
            actions = {
                open_file = {
                    resize_window = true,
                },
                change_dir = {
                    enable = false,
                    global = false,
                    restrict_above_cwd = true,
                },
            },
            renderer = {
                highlight_git = true,
                highlight_opened_files = "none",

                root_folder_label = function(path)
                    local project = vim.fn.fnamemodify(path, ":t")
                    return string.upper(project)
                end,

                indent_markers = {
                    enable = true,
                },

                icons = {
                    webdev_colors = true,
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = false,
                    },
                    glyphs = nonicons_extention.glyphs,
                },
            },
        })

        -- Highlights
        vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = colors.frost.artic_water })
        vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = colors.frost.polar_water })
        vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { fg = colors.frost.artic_ocean })
        vim.api.nvim_set_hl(0, "NvimTreeGitMerge", { fg = colors.aurora.red })
        vim.api.nvim_set_hl(0, "NvimTreeGitRenamed", { fg = colors.aurora.orange })
        vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = colors.aurora.green })
        vim.api.nvim_set_hl(0, "NvimTreeGitIgnored", { fg = colors.aurora.purple })
        vim.api.nvim_set_hl(0, "NvimTreeModifiedFile", { fg = colors.none })
        vim.api.nvim_set_hl(0, "NvimTreeOpenedFile", { fg = colors.none })
    end,
    init = function()
        -- Mappings
        local wk = require("which-key")

        wk.register({
            -- Explore Browser
            E = { ":NvimTreeToggle<cr>", "NvimTr[E]e" },
        }, { prefix = "<leader>", mode = "n" })
    end
}
