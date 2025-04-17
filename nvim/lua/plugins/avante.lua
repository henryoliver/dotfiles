return {
    ---@type LazySpec
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    build = "make",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-treesitter/nvim-treesitter",
        "yamatsum/nvim-nonicons",
    },
    config = function()
        local avante = require("avante")
        local nonicons = require("nvim-nonicons")

        avante.setup({
            claude = { model = "claude-3-7-sonnet-latest" }, -- https://docs.anthropic.com/en/docs/about-claude/models/all-models
            openai = { model = "o4-mini" }, -- https://platform.openai.com/docs/models/compare
            behaviour = {
                auto_set_keymaps = false,
                auto_apply_diff_after_generation = true,
                minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
                enable_token_counting = true, -- Whether to enable token counting. Default to true.
                enable_claude_text_editor_tool_mode = true,
            },
            mappings = {
                submit = {
                    insert = "<CR>",
                },
            },
            hints = { enabled = false },
            windows = {
                sidebar_header = { enabled = false },
                input = {
                    prefix = nonicons.get("chevron-right"),
                },
            },
        })
    end,
    keys = {
        -- https://github.com/yetone/avante.nvim?tab=readme-ov-file#commands
        { "<Leader>i", "<Cmd>AvanteChat<CR>", desc = "AI" },
        { "<Leader>i", "<Cmd>AvanteEdit<CR>", mode = "v", desc = "AI" },
    },
}
