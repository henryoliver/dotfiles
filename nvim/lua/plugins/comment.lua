return {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
        -- Skip deprecated module integration for better performance
        vim.g.skip_ts_context_commentstring_module = true

        local mini_comment = require("mini.comment")
        local ts_context_commentstring = require("ts_context_commentstring")

        -- Disable the autocommand from ts-context-commentstring
        ts_context_commentstring.setup({
            enable_autocmd = false,
        })

        mini_comment.setup({
            -- tsx, jsx, html , svelte comment support
            options = {
                custom_commentstring = function()
                    return ts_context_commentstring.calculate_commentstring() or vim.bo.commentstring
                end,
                -- Whether to ignore blank lines in actions and textobject
                ignore_blank_line = true,
            },
        })
    end,
}
