local spec = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
		"hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
	},
}

function spec:config()
	local cmp = require("cmp")
    local icons = require("config.icons")

	cmp.setup({
		snippet = {
			expand = function(opts)
                vim.fn["vsnip#anonymous"](opts.body) -- For `vsnip` users.
			end,
		},
		experimental = {
			ghost_text = true,
		},
		window = {
			completion = {
				scrolloff = vim.go.scrolloff,
				border = "rounded",
			},
			documentation = {
				border = "rounded",
			},
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(_, item)
				local kind = item.kind
				item.kind = icons.kind[kind]
				item.menu = kind:gsub("(%l)(%u)", "%1 %2"):lower()

				return item
			end,
		},
		sources = {
			{
				name = "nvim_lsp",
				max_item_count = 80,
			},
            { 
                name = "vsnip",
                max_item_count = 80,
            },
			{
				name = "buffer",
				max_item_count = 20,
				option = {
					get_bufnrs = function()
						return vim.tbl_map(function(win)
							return vim.api.nvim_win_get_buf(win)
						end, vim.api.nvim_list_wins())
					end,
				},
			},
		},
        mapping = cmp.mapping.preset.insert({
            ["<c-n>"] = cmp.mapping.select_next_item(),
            ["<c-p>"] = cmp.mapping.select_prev_item(),

            -- Scroll the documentation window if visible.
            ["<c-j>"] = cmp.mapping.scroll_docs(4),
            ["<c-k>"] = cmp.mapping.scroll_docs(-4),

            ["<c-space>"] = cmp.mapping.complete(), -- Invoke completion.

            ["<c-l>"] = cmp.mapping.confirm({ select = true }),
            ["<c-h>"] = cmp.mapping.abort(),
        }),
	})

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" },
        },
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "cmdline" },
            { name = "buffer" },
        }, {
            { name = "path" },
        }),
    })
end

return spec
