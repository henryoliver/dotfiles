---@diagnostic disable: lowercase-global
-- Neovim Lua configuration for luacheck
globals = {
    "vim",
    -- Standard Lua globals commonly used in Neovim configs
    "string",
    "require",
    "pairs",
    "ipairs",
    "next",
    "pcall",
    "xpcall",
    "type",
    "tostring",
    "tonumber",
    "table",
    "math",
    "print",
    "error",
    "assert",
    "select",
    "unpack",
    "setmetatable",
    "getmetatable",
    -- Testing globals (if you use testing frameworks)
    "describe",
    "it",
    "before_each",
    "after_each",
    "setup",
    "teardown",
}

-- Allow unused arguments (common in Neovim event callbacks)
unused_args = false

-- Allow unused variables starting with underscore
unused = false

-- Ignore specific warnings that are common in Neovim configs
ignore = {
    "143", -- accessing undefined field (vim.* API is very dynamic)
    "212", -- unused argument (event callbacks often have unused params)
    "631", -- line is too long (sometimes unavoidable with long plugin names)
}

-- Set max line length (optional, adjust as needed)
max_line_length = 120

-- Use Lua 5.1 standard (what Neovim uses)
std = "lua51"
