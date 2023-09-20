return {
    -- Nvterm
    "NvChad/nvterm",
    lazy = true,
    keys = "<leader>t",
    opts = {
        terminals = {
            type_opts = {
                float = { border = "rounded" },
                horizontal = { location = "rightbelow", split_ratio = .2, },
                vertical = { location = "rightbelow", split_ratio = .5 },
            }
        }
    },
    config = true,
    init = function()
        -- Mappings
        local wk = require("which-key")
        local terminal = require("nvterm.terminal")

        wk.register({
            t = {
                name = "Terminal",
                f = { function() terminal.toggle("float") end, "Float" },
                h = { function() terminal.toggle("horizontal") end, "Horizontal" },
                v = { function() terminal.toggle("vertical") end, "Vertical" },
            },
        }, { prefix = "<leader>", mode = { "n", "t" } })

        vim.keymap.set("t", "<c-w>h", [[<c-\><c-n><c-w>h]])
        vim.keymap.set("t", "<c-w>j", [[<c-\><c-n><c-w>j]])
        vim.keymap.set("t", "<c-w>k", [[<c-\><c-n><c-w>k]])
        vim.keymap.set("t", "<c-w>l", [[<c-\><c-n><c-w>l]])
        vim.keymap.set("t", "<c-w>w", [[<c-\><c-n><c-w>p]])
    end
}
