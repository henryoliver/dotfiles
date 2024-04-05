return {
    -- ZenMode
    -- Distraction-free coding for Neovim >= 0.5
    "folke/zen-mode.nvim",
    lazy = true,
    cmd = "ZenMode",
    opts = {
        window = {
            backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
            -- height and width can be:
            -- * an absolute number of cells when > 1
            -- * a percentage of the width / height of the editor when <= 1
            -- * a function that returns the width or the height
            width = 0.6, -- width of the Zen window
            height = 0.9, -- height of the Zen window
            -- by default, no options are changed for the Zen window
            -- uncomment any of the options below, or add other vim.wo options you want to apply
            options = {
                signcolumn = "no", -- disable signcolumn
                number = false, -- disable number column
                relativenumber = false, -- disable relative numbers
                cursorline = false, -- disable cursorline
                -- cursorcolumn = false, -- disable cursor column
                -- foldcolumn = "0", -- disable fold column
                foldenable = false, -- when off, all folds are open
                -- list = false, -- disable whitespace characters
            },
        },
        plugins = {
            -- disable some global vim options (vim.o...)
            -- comment the lines to not apply the options
            options = {
                enabled = true,
                ruler = false, -- disables the ruler text in the cmd line area
                showcmd = false, -- disables the command in the last line of the screen
            },
            twilight = { enabled = false },
            gitsigns = { enabled = false },
            kitty = {
                enabled = true,
                font = "+6",
            },
        },
        -- callback where you can add custom code when the Zen window opens
        on_open = function()
            require("barbecue.ui").toggle()
            require("sentiment").disable()
        end,
        -- callback where you can add custom code when the Zen window closes
        on_close = function()
            require("barbecue.ui").toggle()
            require("sentiment").enable()
        end,
    },
    init = function()
        -- Mappings
        local wk = require("which-key")

        wk.register({
            z = { ":ZenMode<cr>", "ZenMode" },
        }, { prefix = "<leader>", mode = "n" })
    end,
}
