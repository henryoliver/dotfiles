local nonicons_extention = require("nvim-nonicons.extentions.nvim-tree")

return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        local nvim_tree = require("nvim-tree")

        local colors = require("nord.colors")

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
        vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = colors.nord9_gui })
        vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = colors.nord7_gui })

        vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { fg = colors.nord10_gui })
        vim.api.nvim_set_hl(0, "NvimTreeGitMerge", { fg = colors.nord11_gui })
        vim.api.nvim_set_hl(0, "NvimTreeGitRenamed", { fg = colors.nord12_gui })
        vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = colors.nord14_gui })
        vim.api.nvim_set_hl(0, "NvimTreeGitIgnored", { fg = colors.nord15_gui })

        vim.api.nvim_set_hl(0, "NvimTreeModifiedFile", { fg = colors.none })
        vim.api.nvim_set_hl(0, "NvimTreeOpenedFile", { fg = colors.none })
    end,
    init = function()
        -- Mappings
        vim.keymap.set("n", "<leader>r", ":NvimTreeToggle<cr>", { desc = "NvimTree", silent = true })
    end
}
