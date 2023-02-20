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
                ["c"] = { name = "Comment" },
                ["cC"] = { "<Plug>(comment_toggle_linewise)", "Region Linewise" },
                ["cB"] = { "<Plug>(comment_toggle_blockwise)", "Region Blockwise" },
                ["cc"] = { "<Plug>(comment_toggle_linewise_current)", "Toggle Linewise" },
                ["cb"] = { "<Plug>(comment_toggle_blockwise_current)", "Toggle Blockwise" },
            })

            require("which-key").register({
                ["c"] = { name = "Comment" },
                ["cc"] = { "<Plug>(comment_toggle_linewise_visual)", "Linewise" },
                ["cb"] = { "<Plug>(comment_toggle_blockwise_visual)", "Blockwise" },
            }, { mode = "v" })
        end,
    },
}
