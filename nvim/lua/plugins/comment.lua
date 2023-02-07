return {
    -- Comment
    {
        "numToStr/Comment.nvim",
        event = "BufReadPost",
        dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
            local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

            require("Comment").setup({
                ---Add a space b/w comment and the line
                padding = true,
                ---Whether the cursor should stay at its position
                sticky = true,
                mappings = {
                    basic = false,
                    extra = false,
                },
                pre_hook = ts_context_commentstring.create_pre_hook(),
            })
        end,
        -- Mappings
        init = function()
            require("which-key").register({
                ["<Leader>c"] = { name = "Comment" },
                ["<Leader>cr"] = { "<Plug>(comment_toggle_linewise)", "Toggle Region" },
                ["<Leader>cc"] = { "<Plug>(comment_toggle_linewise_current)", "Toggle Linewise/Blockwise" },
            })

            require("which-key").register({
                ["<Leader>c"] = { name = "Comment" },
                ["<Leader>cc"] = { "<Plug>(comment_toggle_linewise_visual)", "Toggle Linewise/Blockwise" },
            }, { mode = "v" })
        end,
    },
}
