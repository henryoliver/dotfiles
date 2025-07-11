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

-- Toggle relative line numbers based on context
vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave", "WinLeave", "WinEnter", "FocusLost", "FocusGained" }, {
    group = vim.api.nvim_create_augroup("RelativeNumbers", { clear = true }),
    callback = function(event)
        -- Skip if line numbers are disabled or for certain filetypes
        if not vim.wo.number or vim.bo.filetype == "" then
            return
        end

        -- Disable relative numbers for specific filetypes
        local excluded_filetypes = {
            "help",
            "terminal",
            "prompt",
            "neo-tree",
            "oil",
            "trouble",
            "qf",
            "lspinfo",
            "checkhealth",
            "TelescopePrompt",
            "lazy",
            "mason",
            "notify",
            "noice",
            "codecompanion",
            "neogit",
            "fugitive",
            "gitcommit",
            "gitrebase",
            "man",
            "undotree",
            "Outline",
            "dapui_watches",
            "dapui_stacks",
            "dapui_breakpoints",
            "dapui_scopes",
            "dapui_console",
            "dap-repl",
            "neotest-output",
            "neotest-summary",
            "neotest-output-panel",
            "spectre_panel",
            "diff",
        }

        if vim.tbl_contains(excluded_filetypes, vim.bo.filetype) then
            vim.wo.relativenumber = false
            return
        end

        local should_show_relative = event.event == "InsertLeave"
            or event.event == "WinEnter"
            or event.event == "FocusGained"

        vim.wo.relativenumber = should_show_relative
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

-- Restore cursor position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("RestoreCursorPosition", { clear = true }),
    callback = function(event)
        local exclude_ft = { "gitcommit", "gitrebase", "svn", "hgcommit" }
        local buf = event.buf
        if vim.tbl_contains(exclude_ft, vim.bo[buf].filetype) then
            return
        end

        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local line_count = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.api.nvim_win_set_cursor(0, mark)
        end
    end,
})

-- Terminal-specific settings
vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("TerminalSettings", { clear = true }),
    callback = function()
        vim.wo.number = false
        vim.wo.relativenumber = false
        vim.wo.spell = false
        vim.wo.signcolumn = "no"

        -- Enter insert mode automatically
        vim.defer_fn(function()
            if vim.api.nvim_get_current_buf() == vim.fn.bufnr("%") then
                vim.cmd.startinsert()
            end
        end, 100)
    end,
})

-- Large file optimization
vim.api.nvim_create_autocmd("BufReadPre", {
    group = vim.api.nvim_create_augroup("LargeFileOptimization", { clear = true }),
    callback = function(event)
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(event.buf))
        if ok and stats and stats.size > 1024 * 1024 then -- 1MB
            vim.b[event.buf].large_file = true
            vim.opt_local.eventignore:append({ "FileType", "Syntax" })
            vim.bo.undolevels = -1
            vim.bo.swapfile = false
            vim.wo.foldmethod = "manual"
            vim.wo.spell = false
            vim.wo.wrap = false
            vim.wo.relativenumber = false
            vim.wo.number = false
        end
    end,
})
