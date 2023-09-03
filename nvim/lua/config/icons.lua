-- https://github.com/yamatsum/nvim-nonicons/blob/main/lua/nvim-nonicons/mapping.lua
-- local nonicons = require("nvim-nonicons")
local icons = {}

icons.layout = {
    list = "•",
    tab = "→",
    wrap = "↪",
    installed = "✓",
    pending = "➜",
    uninstalled = "✗",
}

icons.widget = {
    active = "",
    command = "",
    config = "",
    event = "",
    filetype = "",
    import = "",
    inactive = "",
    keymap = "",
    lazy = "",
    nesting = "",
    plugin = "",
    runtime = "",
    source = "",
    start = "",
    task = "",
    -- telescope = nonicons.get("telescope"),
    telescope = "",
}

icons.log = {
    error = "",
    warning = "",
    hint = "",
    information = "",
    beaker = "",
    constant = "",
    paste = "",
    dot_fill = ""
}

icons.kind = {
    Array = "",
    Boolean = "",
    Object = "",
    Folder = "",
    Null = "",
    Namespace = "",
    Key = "",
    Package = "",
    Number = "",
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

icons.file = {
    typescript = "",
    css = "",
    scss = "",
    javascript = "",
    javascriptreact = "",
    html = "",
    python = "",
    java = "",
    markdown = "",
    sh = "",
    zsh = "",
    vim = "",
    lua = "",
    haskell = "",
    conf = "",
    ruby = "",
    txt = "",
    rust = "",
    cpp = "",
    c = "",
    go = "",
}

return icons
