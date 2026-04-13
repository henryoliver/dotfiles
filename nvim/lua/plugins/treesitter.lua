return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
        -- Register .pine files as pinescript filetype using JavaScript treesitter
        vim.filetype.add({
            extension = {
                pine = "pinescript",
                psl = "pinescript",
            },
        })
        vim.treesitter.language.register("javascript", "pinescript")
    end,
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            auto_install = true,
            ensure_installed = {
                "bash",
                "css",
                "dockerfile",
                "git_config",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "go",
                "html",
                "javascript",
                "json",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "ruby",
                "rust",
                "svelte",
                "typescript",
                "tsx",
                "vim",
                "vimdoc",
                "yaml",
            },
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = { enable = false },
        })
    end,
}
