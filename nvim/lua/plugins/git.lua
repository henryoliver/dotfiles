local map = vim.api.nvim_set_keymap
local default_options = { noremap = true, silent = true }

return {
    -- Git
    {
        "TimUntersberger/neogit",
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
        -- Mappings
        init = function()
            require("which-key").register({
                ["<Leader>g"] = { name = "Git" },
                ["<Leader>go"] = { "<Cmd>Neogit<CR>", "Neogit" },
            })
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
        -- Mappings
        init = function()
            require("which-key").register({
                ["<Leader>gb"] = { "<Cmd>Gitsigns toggle_current_line_blame<CR>", "Blame Toggle" },

                ["<Leader>gh"] = { name = "Hunk" },
                ["<Leader>ghp"] = { "<Cmd>Gitsigns preview_hunk<CR>", "Hunk Preview" },
                ["<Leader>ghd"] = { "<Cmd>Gitsigns diffthis<CR>", "Hunk Diff" },
                ["<Leader>ghr"] = { "<Cmd>Gitsigns reset_hunk<CR>", "Reset Hunk" },
                ["<Leader>ght"] = { "<Cmd>Gitsigns setqflist<CR>", "Open Trouble List" },
            })

            map("n", "[h", "<Cmd>Gitsigns next_hunk<CR>", default_options)
            map("n", "]h", "<Cmd>Gitsigns prev_hunk<CR>", default_options)
        end,
    },
    {
        "sindrets/diffview.nvim",
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
        -- Mappings
        init = function()
            require("which-key").register({
                ["<Leader>gd"] = { name = "Diffview" },
                ["<Leader>gdo"] = { "<Cmd>DiffviewOpen<CR>", "Merge Tool" },
                ["<Leader>gdh"] = { "<Cmd>DiffviewFileHistory<CR>", "File History Branch" },
                ["<Leader>gdf"] = { "<Cmd>DiffviewFileHistory %<CR>", "File History File" },
                ["<Leader>gdx"] = { "<Cmd>DiffviewClose<CR>", "Close the current diffview" },
            })
        end,
    },
    {
        "ruifm/gitlinker.nvim",
        keys = { "<Leader>gl" },
        dependencies = "nvim-lua/plenary.nvim",
        opts = {
            mappings = nil,
        },
        -- Mappings
        init = function()
            require("which-key").register({
                ["<Leader>gl"] = { name = "Link" },
                ["<Leader>glh"] = {
                    "<Cmd>lua require('gitlinker').get_repo_url({ action_callback = require('gitlinker.actions').open_in_browser })<CR>",
                    "Home URL",
                },
                ["<Leader>gll"] = {
                    "<Cmd>lua require('gitlinker').get_buf_range_url('n', { action_callback = require('gitlinker.actions').open_in_browser })<CR>",
                    "Buffer Line URL",
                },
            })

            require("which-key").register({
                ["<Leader>g"] = { name = "Git" },
                ["<Leader>gl"] = { name = "Link" },
                ["<Leader>gll"] = {
                    "<Cmd>lua require('gitlinker').get_buf_range_url('n', { action_callback = require('gitlinker.actions').open_in_browser })<CR>",
                    "Buffer Line URL",
                },
            }, { mode = "v" })
        end,
    },
}
