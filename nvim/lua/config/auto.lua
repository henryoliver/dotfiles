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
        "codecompanion",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.schedule(function()
            vim.keymap.set("n", "q", function()
                vim.cmd("bwipeout")
            end, {
                buffer = event.buf,
                silent = true,
                desc = "Wipe buffer",
            })
        end)
    end,
})

-- Disables relative line numbers when they don't make sense
vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
    group = vim.api.nvim_create_augroup("DisableRelativeNumbers", { clear = true }),
    callback = function(event)
        -- Only proceed if line numbers are enabled for this buffer
        if not vim.opt_local.number:get() then
            return
        end

        if event.event == "InsertEnter" then
            vim.opt_local.relativenumber = false
        else
            vim.opt_local.relativenumber = true
        end
    end,
})
