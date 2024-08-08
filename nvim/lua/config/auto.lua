-- Prevent new line to also start with a comment
-- vim.api.nvim_create_augroup("NewLineComment", { clear = true })
-- vim.api.nvim_create_autocmd("FileType", {
--     group = "NewLineComment",
--     pattern = "*",
--     callback = function()
--         vim.opt_local.formatoptions:remove("cro")
--     end,
-- })

-- Set up an auto-command group for handling new line comments
local group_id = vim.api.nvim_create_augroup("FormatOptions", { clear = true })
-- Remove 'c', 'r', and 'o' options from 'formatoptions' for all file types
vim.api.nvim_create_autocmd("FileType", {
    group = group_id,
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- Plugins
