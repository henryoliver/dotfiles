local spec = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdateSync",
	cmd = "TSUpdateSync",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
}

function spec:config()
	local treesitter = require("nvim-treesitter.configs")

	treesitter.setup({
        ensure_installed = {
            "bash",
            "css",
            "dockerfile",
            "git_config",
            "git_rebase",
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
            "regex",
            "ruby",
            "rust",
            "typescript",
            "vim",
        },
        auto_install = true,
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<c-l>",
                scope_incremental = "<c-l>",
                node_incremental = "<c-j>",
                node_decremental = "<c-k>",
            },
        },
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
	})
end

return spec
