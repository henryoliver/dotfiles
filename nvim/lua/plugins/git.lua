return {
    -- Git
    {
        "NeogitOrg/neogit",
        lazy = true,
        cmd = "Neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "sindrets/diffview.nvim",
        },
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

            wk.add({
                { "<leader>g", group = "Git" },
                { "<leader>gn", ":Neogit<cr>", desc = "Neogit" },
            })
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
        init = function()
            -- Mappings
            local wk = require("which-key")
            local gitsigns = require("gitsigns")

            wk.add({
                { "<leader>gb", gitsigns.toggle_current_line_blame, desc = "Blame Toggle" },
                { "<leader>gh", group = "Hunk" },
                { "<leader>ghd", gitsigns.preview_hunk, desc = "Hunk Diff" },
                { "<leader>ghp", gitsigns.diffthis, desc = "Hunk Preview" },
                { "<leader>ghr", gitsigns.reset_hunk, desc = "Reset Hunk" },
            })

            vim.keymap.set("n", "]h", gitsigns.next_hunk)
            vim.keymap.set("n", "[h", gitsigns.prev_hunk)
        end,
    },
    {
        "sindrets/diffview.nvim",
        lazy = true,
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
            "DiffviewRefresh",
            "DiffviewFileHistory",
        },
        dependencies = "nvim-lua/plenary.nvim",
        opts = {
            diff_binaries = false,
            enhanced_diff_hl = true,
            use_icons = true,
        },
        init = function()
            -- Mappings
            local wk = require("which-key")

            wk.add({
                { "<leader>gd", group = "Diff" },
                { "<leader>gdc", ":DiffviewClose<cr>", desc = "Close" },
                { "<leader>gdf", ":DiffviewFileHistory %<cr>", desc = "File History" },
                { "<leader>gdh", ":DiffviewFileHistory<cr>", desc = "File History Branch" },
                { "<leader>gdo", ":DiffviewOpen<cr>", desc = "Merge Tool" },
            })
        end,
    },
    {
        "ruifm/gitlinker.nvim",
        event = "VeryLazy",
        dependencies = "nvim-lua/plenary.nvim",
        opts = {
            mappings = nil,
        },
        init = function()
            -- Mappings
            local wk = require("which-key")
            local gitlinker = require("gitlinker")

            wk.add({
                { "<leader>gl", group = "Linker" },
                {
                    "<leader>glh",
                    function()
                        gitlinker.get_repo_url({
                            action_callback = require("gitlinker.actions").open_in_browser,
                        })
                    end,
                    desc = "Home URL",
                },
                {
                    "<leader>gll",
                    function()
                        gitlinker.get_buf_range_url(
                            "n",
                            { action_callback = require("gitlinker.actions").open_in_browser }
                        )
                    end,
                    desc = "Buffer Line URL",
                },
            })
        end,
    },
}
