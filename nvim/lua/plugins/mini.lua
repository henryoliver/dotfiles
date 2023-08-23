return {
    -- Mini
    "echasnovski/mini.nvim",
    lazy = true,
    event = "BufReadPost",
    config = function()
        local icons = require("nvim-nonicons")

        local clue = require("mini.clue")
        local bracketed = require("mini.bracketed")
        local splitjoin = require("mini.splitjoin")

        clue.setup({
            triggers = {
                -- Leader triggers
                { mode = 'n', keys = '<leader>' },
                { mode = 'x', keys = '<leader>' },

                -- `g` key
                { mode = 'n', keys = 'g' },
                { mode = 'x', keys = 'g' },

                -- Window commands
                { mode = 'n', keys = '<C-w>' },

                -- `z` key
                { mode = 'n', keys = 'z' },
                { mode = 'x', keys = 'z' },
            },

            clues = {
                { mode = 'n', keys = '<leader>s', desc = icons.get("plus") .. ' Search' },
                { mode = 'n', keys = '<leader>f', desc = icons.get("plus") .. ' Find & Replace' },
                { mode = 'n', keys = '<leader>l', desc = icons.get("plus") .. ' LSP' },
                { mode = 'n', keys = '<leader>p', desc = icons.get("plus") .. ' LSP Preview' },
                { mode = 'n', keys = '<leader>t', desc = icons.get("plus") .. ' Terminal' },

                clue.gen_clues.g(),
                clue.gen_clues.windows(),
                clue.gen_clues.z(),
            },

            window = {
                config = {
                    -- Compute window width automatically
                    width = 'auto',

                    -- Use double-line border
                    border = 'rounded',
                },
            },
        })

        bracketed.setup({
            -- First-level elements are tables describing behavior of a target:
            --
            -- - <suffix> - single character suffix. Used after `[` / `]` in mappings.
            --   For example, with `b` creates `[B`, `[b`, `]b`, `]B` mappings.
            --   Supply empty string `''` to not create mappings.
            --
            -- - <options> - table overriding target options.
            --
            -- See `:h MiniBracketed.config` for more info.
            buffer     = { suffix = 'b', options = {} },
            comment    = { suffix = 'c', options = {} },
            conflict   = { suffix = 'x', options = {} },
            diagnostic = { suffix = 'd', options = {} },
            file       = { suffix = 'f', options = {} },
            indent     = { suffix = 'i', options = {} },
            jump       = { suffix = 'j', options = {} },
            location   = { suffix = 'l', options = {} },
            oldfile    = { suffix = 'o', options = {} },
            quickfix   = { suffix = 'q', options = {} },
            treesitter = { suffix = 't', options = {} },
            undo       = { suffix = 'u', options = {} },
            window     = { suffix = 'w', options = {} },
            yank       = { suffix = 'y', options = {} },
        })

        splitjoin.setup({
            mappings = {
                toggle = 'gS',
                split = '',
                join = '',
            },
        })
    end
}
