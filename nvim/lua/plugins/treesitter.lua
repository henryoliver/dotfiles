return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master", -- Use stable frozen branch with auto-highlighting
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
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
                "javascript", -- Needed for PineScript
                "json",
                "lua",
                "make",
                "markdown",
                "python",
                "regex",
                "ruby",
                "rust",
                "svelte",
                "typescript",
                "tsx",
                "vim",
                "yaml",
            },
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = { enable = false },
        })

        vim.g.skip_ts_context_commentstring_module = true
    end,
}
