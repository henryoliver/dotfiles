-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("CloseWithQ", { clear = true }),
    pattern = {
        "",
        "PlenaryTestPopup",
        "checkhealth",
        "gitsigns-blame",
        "grug-far",
        "help",
        "lspinfo",
        "notify",
        "qf",
        "NeogitStatus",
        "oil", -- oil.nvim file explorer
        "trouble", -- trouble.nvim diagnostics
        "lsp-installer", -- mason.nvim installer
        "netrw", -- netrw file browser
        "startuptime", -- startuptime plugin
        "fugitive", -- vim-fugitive
        "neo-tree", -- neo-tree file explorer
        "TelescopePrompt", -- telescope preview
        "spectre_panel", -- spectre search/replace
        "noice", -- noice.nvim popups
        "DressingInput", -- dressing.nvim input
        "DressingSelect", -- dressing.nvim select
        "codecompanion", -- codecompanion chat
        "diff", -- diff mode
        "git", -- git related buffers
        "gitcommit", -- git commit messages
        "gitrebase", -- git rebase
        "man", -- man pages
        "tsplayground", -- treesitter playground
        "undotree", -- undotree
        "Outline", -- outline/symbols
        "dapui_watches", -- dap ui
        "dapui_stacks",
        "dapui_breakpoints",
        "dapui_scopes",
        "dapui_console",
        "dap-repl",
        "neotest-output",
        "neotest-summary",
        "neotest-output-panel",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", function()
            -- Try to close the window first, fallback to wiping buffer
            local win_count = vim.api.nvim_tabpage_list_wins(0)
            if #win_count > 1 then
                vim.cmd.close()
            else
                vim.cmd.bwipeout()
            end
        end, {
            buffer = event.buf,
            silent = true,
            desc = "Close window or wipe buffer",
        })
    end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 200,
            on_macro = false,
        })
    end,
})
