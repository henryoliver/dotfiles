-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Map the leader key
vim.g.mapleader = " "

-- Plugin manager
require("lazy").setup("plugins", {
    defaults = {
        lazy = true,   -- should plugins be lazy-loaded?
        version = "*", -- enable this to try installing the latest stable versions of plugins
    },
    install = { colorscheme = { "nord" } },
    checker = { enabled = true },
    change_detection = {
        notify = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "zip",
                "zipPlugin",
                "loaded_tar",
                "loaded_tarPlugin",
                "fzf",
                "tar",
                "tarPlugin",
                "getscript",
                "getscriptPlugin",
                "vimball",
                "vimballPlugin",
                "2html_plugin",
                "man",
                "matchit",
                "matchparen",
                "logiPat",
                "rrhelper",
                "shada_plugin",
                "netrw",
                "netrwPlugin",
                "netrwSettings",
                "netrwFileHandlers",
            },
        },
    },
})
