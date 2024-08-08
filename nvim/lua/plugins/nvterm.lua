return {
    -- Nvterm
    "NvChad/nvterm",
    lazy = true,
    keys = "<leader>t",
    opts = {
        terminals = {
            type_opts = {
                float = { border = "rounded", width = 0.5, height = 0.5 },
                horizontal = { location = "rightbelow", split_ratio = 0.2 },
                vertical = { location = "rightbelow", split_ratio = 0.5 },
            },
        },
    },
    init = function()
        -- Mappings
        local wk = require("which-key")
        local terminal = require("nvterm.terminal")

        wk.add({
            { "<leader>t", group = "Terminal" },
            {
                "<leader>tf",
                function()
                    terminal.toggle("float")
                end,
                desc = "Float",
            },
            {
                "<leader>th",
                function()
                    terminal.toggle("horizontal")
                end,
                desc = "Horizontal",
            },
            {
                "<leader>tv",
                function()
                    terminal.toggle("vertical")
                end,
                desc = "Vertical",
            },
        })

        vim.keymap.set("t", "<c-w>h", [[<c-\><c-n><c-w>h]])
        vim.keymap.set("t", "<c-w>j", [[<c-\><c-n><c-w>j]])
        vim.keymap.set("t", "<c-w>k", [[<c-\><c-n><c-w>k]])
        vim.keymap.set("t", "<c-w>l", [[<c-\><c-n><c-w>l]])
        vim.keymap.set("t", "<c-w>w", [[<c-\><c-n><c-w>p]])
    end,
}
