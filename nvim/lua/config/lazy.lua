-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"

    -- Better output formatting for the clone process
    vim.notify("Installing lazy.nvim plugin manager...", vim.log.levels.INFO)

    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end

    vim.notify("lazy.nvim installed successfully!", vim.log.levels.INFO)
end
vim.opt.rtp:prepend(lazypath)

-- Plugin manager configuration
require("lazy").setup({
    -- Plugin specifications
    spec = {
        { import = "plugins" },
        -- You can add additional plugin specs here if needed
        -- { import = "plugins.extras" }, -- for optional extras
    },

    -- Default plugin configuration
    defaults = {
        lazy = true, -- lazy-load by default
        version = false, -- always use latest commit (set to "*" for version pinning)
    },

    -- Installation settings
    install = {
        missing = true, -- install missing plugins on startup
        colorscheme = { "nord", "default" }, -- fallback colorschemes
    },

    -- Update checker
    checker = {
        enabled = true,
        notify = true, -- get notified when updates are available
        frequency = 3600, -- check for updates every hour
        check_pinned = false, -- don't check for updates on pinned plugins
    },

    -- Change detection
    change_detection = {
        enabled = true,
        notify = false, -- don't notify for config changes (can be noisy)
    },

    -- Performance optimizations
    performance = {
        cache = {
            enabled = true,
        },
        reset_packpath = true, -- reset packpath to improve startup time
        rtp = {
            reset = true, -- reset runtimepath to improve startup time
            paths = {}, -- add any custom paths here
            disabled_plugins = {
                -- Keep this aligned with lazy.nvim's documented built-ins.
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "rplugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },

    -- UI configuration
    ui = {
        size = { width = 0.8, height = 0.8 },
        wrap = true, -- wrap long lines in the UI
        border = "rounded",
        backdrop = 60, -- backdrop opacity
        title = nil, -- use default title
        title_pos = "center",
    },
})
