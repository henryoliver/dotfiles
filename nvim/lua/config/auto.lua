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

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
    group = vim.api.nvim_create_augroup("AutoResize", { clear = true }),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("RemoveTrailingWhitespace", { clear = true }),
    pattern = "*",
    callback = function()
        -- Skip for certain filetypes
        local excluded_filetypes = { "markdown", "diff", "git", "gitcommit" }
        if vim.tbl_contains(excluded_filetypes, vim.bo.filetype) then
            return
        end

        -- Save cursor position
        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        local last_search = vim.fn.getreg("/")

        -- Remove trailing whitespace
        vim.cmd([[%s/\s\+$//e]])

        -- Restore cursor position and last search
        vim.api.nvim_win_set_cursor(0, cursor_pos)
        vim.fn.setreg("/", last_search)
    end,
})

-- Close quickfix/loclist when last window
vim.api.nvim_create_autocmd("WinEnter", {
    group = vim.api.nvim_create_augroup("CloseQuickfixOnLastWindow", { clear = true }),
    callback = function()
        if vim.fn.winnr("$") == 1 and vim.bo.buftype == "quickfix" then
            vim.cmd.quit()
        end
    end,
})
