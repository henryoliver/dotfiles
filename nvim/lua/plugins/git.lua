return {
    -- Git
    {
        "TimUntersberger/neogit",
        lazy = true,
        cmd = "Neogit",
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
            vim.keymap.set("n", "<leader>gn", ":Neogit<cr>", { desc = "Neogit" })
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        event = "BufRead",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
        init = function()
            local gitsigns = require("gitsigns")

            -- Mappings
            -- vim.keymap.set("n", "<leader>gb", gitsigns.toggle_current_line_blame, { desc = "Blame Toggle" })
            vim.keymap.set("n", "<leader>gb", function() gitsigns.blame_line { full = true } end,
                { desc = "Blame Toggle" })

            vim.keymap.set("n", "<leader>ghp", gitsigns.preview_hunk, { desc = "Hunk Preview" })
            vim.keymap.set("n", "<leader>ghd", gitsigns.diffthis, { desc = "Hunk Diff" })
            vim.keymap.set("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "Reset Hunk" })

            vim.keymap.set("n", "[h", gitsigns.next_hunk)
            vim.keymap.set("n", "]h", gitsigns.prev_hunk)
        end,
    },
    {
        "sindrets/diffview.nvim",
        lazy = true,
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
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
            vim.keymap.set("n", "<leader>gdo", ":DiffviewOpen<cr>", { desc = "Merge Tool" })
            vim.keymap.set("n", "<leader>gdh", ":DiffviewFileHistory<cr>", { desc = "File History Branch" })
            vim.keymap.set("n", "<leader>gdf", ":DiffviewFileHistory %<cr>", { desc = "File History File" })
            vim.keymap.set("n", "<leader>gdx", ":DiffviewClose<cr>", { desc = "Close the current diffview" })
        end,
    },
    {
        "ruifm/gitlinker.nvim",
        lazy = true,
        keys = { "<leader>gl", { "<leader>gl", mode = "v" } },
        dependencies = "nvim-lua/plenary.nvim",
        opts = {
            mappings = nil,
        },
        init = function()
            local gitlinker = require('gitlinker')

            -- Mappings
            vim.keymap.set("n", "<leader>glh",
                function() gitlinker.get_repo_url({ action_callback = require('gitlinker.actions').open_in_browser }) end,
                { desc = "Home URL" })
            vim.keymap.set("n", "<leader>gll",
                function()
                    gitlinker.get_buf_range_url('n',
                        { action_callback = require('gitlinker.actions').open_in_browser })
                end,
                { desc = "Buffer Line URL" })
        end,
    },
}

