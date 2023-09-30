return {
    -- Comment
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
            local comment = require("Comment")
            local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

            comment.setup({
                ---Add a space b/w comment and the line
                padding = true,
                ---Whether the cursor should stay at its position
                sticky = true,
                mappings = {
                    basic = true,
                    extra = false,
                },
                pre_hook = ts_context_commentstring.create_pre_hook(),
            })
        end,
    },
}
