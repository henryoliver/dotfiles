return {
    -- Git
    {
        "TimUntersberger/neogit",
        lazy = true,
        keys = "<leader>g",
        dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
        opts = {
            signs = {
                section = { "", "" },
                item = { "", "" },
                hunk = { "", "" },
            },
            integrations = {
                diffview = true,
            },
        },
        init = function()
            -- Mappings
            local wk = require("which-key")

            wk.register({
                g = {
                    name = "Git",
                    n = { ":Neogit<CR>", "Neogit" },
                }
            }, { prefix = "<leader>", mode = "n" })
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        event = "BufRead",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
        init = function()
            -- Mappings
            local wk = require("which-key")
            local gitsigns = require("gitsigns")

            wk.register({
                g = {
                    b = { gitsigns.toggle_current_line_blame, "Blame Toggle" },
                    h = {
                        name = "Hunk",
                        p = { gitsigns.preview_hunk, "Hunk Preview" },
                        d = { gitsigns.diffthis, "Hunk Diff" },
                        r = { gitsigns.reset_hunk, "Reset Hunk" },
                    }
                }
            }, { prefix = "<leader>", mode = "n" })

            vim.keymap.set("n", "[h", gitsigns.next_hunk)
            vim.keymap.set("n", "]h", gitsigns.prev_hunk)
        end,
    },
    {
        "sindrets/diffview.nvim",
        lazy = true,
        keys = "<leader>g",
        dependencies = "nvim-lua/plenary.nvim",
        opts = {
            diff_binaries = false,
            enhanced_diff_hl = true,
            use_icons = true,
        },
        config = function()
            local colors = require("nord.colors").palette

            -- Highlights
            vim.api.nvim_set_hl(0, "DiffAdd", { foreground = colors.aurora.green, background = colors.none, bold = true })
            vim.api.nvim_set_hl(0, "DiffChange",
                { foreground = colors.aurora.yellow, background = colors.none, bold = true })
            vim.api.nvim_set_hl(0, "DiffDelete",
                { foreground = colors.aurora.red, background = colors.none, bold = true })
            vim.api.nvim_set_hl(0, "DiffText",
                { foreground = colors.aurora.purple, background = colors.none, bold = true })
        end,
        init = function()
            -- Mappings
            local wk = require("which-key")

            wk.register({
                g = {
                    d = {
                        name = "Diff",
                        o = { ":DiffviewOpen<cr>", "Merge Tool" },
                        h = { ":DiffviewFileHistory<cr>", "File History Branch" },
                        f = { ":DiffviewFileHistory %<cr>", "File History" },
                        c = { ":DiffviewClose<cr>", "Close" },
                    }
                },
            }, { prefix = "<leader>", mode = "n" })
        end,
    },
    {
        "ruifm/gitlinker.nvim",
        lazy = true,
        keys = "<leader>g",
        dependencies = "nvim-lua/plenary.nvim",
        opts = {
            mappings = nil,
        },
        init = function()
            -- Mappings
            local wk = require("which-key")
            local gitlinker = require('gitlinker')

            wk.register({
                g = {
                    l = {
                        name = "Linker",
                        h = {
                            function()
                                gitlinker.get_repo_url({
                                    action_callback = require('gitlinker.actions').open_in_browser })
                            end, "Home URL" },
                        l = { function()
                            gitlinker.get_buf_range_url('n',
                                { action_callback = require('gitlinker.actions').open_in_browser })
                        end, "Buffer Line URL" },
                    }
                }
            }, { prefix = "<leader>", mode = "n" })
        end,
    },
}
