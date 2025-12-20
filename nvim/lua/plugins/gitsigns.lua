return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local gitsigns = require("gitsigns")
        local colors = require("nord.colors").palette

        gitsigns.setup({
            signs = {
                delete = { text = "⁞" }, -- ": ⁚ ⁝ ⁞"
                topdelete = { text = "⁞" },
                changedelete = { text = "┃" },
                untracked = { text = "⁞" },
            },
            signs_staged = {
                delete = { text = "⁞" }, -- ": ⁚ ⁝ ⁞"
                topdelete = { text = "⁞" },
                changedelete = { text = "┃" },
                untracked = { text = "⁞" },
            },
            on_attach = function(bufnr)
                local gs = require("gitsigns")

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation with diff mode support
                map("n", "]h", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        gs.nav_hunk("next")
                    end
                end, { desc = "Next hunk" })

                map("n", "[h", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        gs.nav_hunk("prev")
                    end
                end, { desc = "Previous hunk" })

                -- Actions
                map("n", "<Leader>ghr", gs.reset_hunk, { desc = "Reset hunk" })
                map("n", "<Leader>ghp", gs.preview_hunk, { desc = "Preview hunk" })
                map("n", "<Leader>ghi", gs.preview_hunk_inline, { desc = "Preview inline" })
                map("n", "<Leader>gb", gs.toggle_current_line_blame, { desc = "Toggle blame" })
            end,
        })

        -- Custom Nord highlights (optional - only overriding specific colors)
        vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.frost.ice })
        vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.aurora.yellow })
        vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.aurora.red })
        vim.api.nvim_set_hl(0, "GitSignsChangedelete", { fg = colors.aurora.yellow })
        vim.api.nvim_set_hl(0, "GitSignsTopdelete", { fg = colors.aurora.red })
        vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = colors.frost.ice })
    end,
}
