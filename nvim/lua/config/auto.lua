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
        "NvimTree",
        "TelescopePrompt",
        "noice",
        "diff",
        "git",
        "gitcommit",
        "gitrebase",
        "man",
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
        vim.hl.on_yank({
            higroup = "IncSearch",
            timeout = 200,
            on_macro = false,
        })
    end,
})

-- Clean up old backup and swap files (30 days)
vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("CleanupOldBackups", { clear = true }),
    callback = function()
        local data_path = vim.fn.stdpath("data")
        local backup_dir = data_path .. "/backup"
        local swap_dir = data_path .. "/swap"
        
        -- Clean files older than 30 days (2592000 seconds)
        local cleanup_cmd = string.format(
            'find "%s" "%s" -type f -mtime +30 -delete 2>/dev/null &',
            backup_dir,
            swap_dir
        )
        vim.fn.jobstart(cleanup_cmd, { detach = true })
    end,
})
