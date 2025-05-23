return {
    ---@type LazySpec
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "yamatsum/nvim-nonicons",
    },
    config = function()
        local nonicons = require("nvim-nonicons")
        local avante = require("avante")

        -- https://codecompanion.olimorris.dev/getting-started.html#variables
        avante.setup({
            provider = "claude",
            auto_suggestions_provider = "claude",
            claude = { model = "claude-3-7-sonnet-latest" },
            openai = { model = "o4-mini" },
            -- dual_boost = {
            --     enabled = true,
            --     first_provider = "claude",
            --     second_provider = "openai",
            --     prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
            -- },
            behaviour = {
                auto_suggestions = false, -- Experimental stage
                auto_set_highlight_group = true,
                auto_set_keymaps = false,
                auto_apply_diff_after_generation = true,
                support_paste_from_clipboard = false,
                minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
                enable_token_counting = false, -- Whether to enable token counting. Default to true.
            },
            hints = { enabled = false },
            windows = {
                ---@type "right" | "left" | "top" | "bottom"
                position = "right", -- the position of the sidebar
                wrap = true, -- similar to vim.o.wrap
                width = 30, -- default % based on available width
                sidebar_header = {
                    enabled = true, -- true, false to enable/disable the header
                    align = "center", -- left, center, right for title
                    rounded = true,
                },
                input = {
                    prefix = "" .. nonicons.get("chevron-right") .. " ",
                    height = 8, -- Height of the input window in vertical layout
                },
                edit = {
                    border = "solid",
                    start_insert = true, -- Start insert mode when opening the edit window
                },
                ask = {
                    floating = false, -- Open the 'AvanteAsk' prompt in a floating window
                    start_insert = true, -- Start insert mode when opening the ask window
                    border = "rounded",
                    ---@type "ours" | "theirs"
                    focus_on_apply = "ours", -- which diff to focus after applying
                },
            },
        })
    end,
    keys = {
        -- https://github.com/yetone/avante.nvim?tab=readme-ov-file#commands
        { "<Leader>iac", "<Cmd>AvanteChat<CR>", mode = "n", desc = "Chat" },
        { "<Leader>iat", "<Cmd>AvanteToggle<CR>", mode = "n", desc = "Toggle" },

        { "<Leader>iaf", "<Cmd>AvanteFocus<CR>", mode = "n", desc = "Focus" },
        { "<Leader>iar", "<Cmd>AvanteRefresh<CR>", mode = "n", desc = "Refresh" },

        { "<Leader>ias", "<Cmd>AvanteStop<CR>", mode = "n", desc = "Stop" },
        { "<Leader>iax", "<Cmd>AvanteClear<CR>", mode = "n", desc = "Clear" },

        { "<Leader>iab", "<Cmd>AvanteBuild<CR>", mode = "n", desc = "Build Dependencies" },
        { "<Leader>iam", "<Cmd>AvanteShowRepoMap<CR>", mode = "n", desc = "Show Repo Map" },

        { "<Leader>iae", "<Cmd>AvanteEdit<CR>", mode = "v", desc = "Edit" },
    },
}
