local icons = require("config.icons")

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

-- Plugin manager
require("lazy").setup("plugins", {
    concurrency = 4,
    install = { colorscheme = { "nord" } },
    checker = { enabled = true },
    change_detection = { notify = false },
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
    ui = {
        border = "rounded",
        icons = {
            lazy = icons.widget.lazy .. "  ",
            not_loaded = icons.widget.inactive,
            loaded = icons.widget.active,
            task = icons.widget.task,
            source = icons.widget.source,
            start = icons.widget.start,
            plugin = icons.widget.plugin,
            event = icons.widget.event,
            keys = icons.widget.keymap,
            cmd = icons.widget.command,
            ft = icons.widget.filetype,
            init = icons.widget.config,
            runtime = icons.widget.runtime,
            import = icons.widget.import,
            config = icons.widget.config,
            list = {
                icons.layout.list,
                icons.layout.list,
                icons.layout.list,
                icons.layout.list,
            },
        },
    },
})
