return {
	-- LSP
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local icons = require("config.icons")
		local lspconfig = require("lspconfig")

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local servers = {
			"bashls",
			"cssls",
			"gopls",
			"html",
			"jsonls",
			"lua_ls",
			"pylsp",
			"ruby_ls",
			"tailwindcss",
			"tsserver",
			"vimls",
		}

		for _, lsp in ipairs(servers) do
			local config = { capabilities = capabilities }

			-- Custom settings
			if lsp == "tailwindcss" then -- Tailwind
				config.filetypes = { "css", "typescriptreact" }
				config.settings = {
					tailwindCSS = {
						lint = {
							invalidScreen = "error",
							invalidVariant = "error",
							invalidTailwindDirective = "error",
							invalidApply = "error",
							invalidConfigPath = "error",
							cssConflict = "warning",
							recommendedVariantOrder = "warning",
						},
						validate = true,
					},
				}
			elseif lsp == "lua_ls" then -- Lua
				config.settings = {
					Lua = {
						-- Get the language server to recognize the `vim` global
						diagnostics = { globals = { "vim", "string", "require", "pairs" } },
					},
				}
			end

			lspconfig[lsp].setup(config)
		end

		-- Diagnostics
		vim.diagnostic.config({
			signs = true,
			underline = false,
			virtual_text = false,
			severity_sort = true,
			update_in_insert = false,
			float = {
				source = true,
				focusable = false,
				border = "rounded", -- none, single, double, rounded, solid
				header = " Diagnostics",
				prefix = " " .. icons.layout.list .. " ",
				suffix = " ",
			},
		})

		local signs = {
			Error = icons.log.error,
			Warn = icons.log.warning,
			Hint = icons.log.hint,
			Info = icons.log.information,
		}

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, linehl = nil, numhl = nil, culhl = nil })
		end
	end,
	init = function()
		-- Mappings
		local wk = require("which-key")
		local conform = require("conform")
		local telescope = require("telescope.builtin")

		wk.register({
			l = {
				name = "LSP",
				h = { vim.lsp.buf.hover, "[H]over" },
				n = { vim.lsp.buf.rename, "Re[n]ame" },
				a = { vim.lsp.buf.code_action, "[A]ction" },
				r = { telescope.lsp_references, "[R]eferences" },
				d = { telescope.lsp_definitions, "[D]efinition" },
				g = { telescope.diagnostics, "Dia[g]nostics" },
				i = { telescope.lsp_implementations, "[I]mplementations" },
				c = { vim.lsp.buf.declaration, "De[c]laration" },
				s = { vim.lsp.buf.signature_help, "[S]ignature" },
				y = { telescope.lsp_document_symbols, "S[y]mbols" },
				t = { telescope.lsp_type_definitions, "[T]ype Definition" },
				f = {
					function()
						conform.format({ async = true })
					end,
					"[F]ormat",
				},
			},
		}, { prefix = "<leader>", mode = "n" })

		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
	end,
}
