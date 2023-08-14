return {
    -- Nvim CMP
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            { "tzachar/cmp-tabnine", build = "./install.sh" },
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "onsails/lspkind-nvim",
            { "yamatsum/nvim-nonicons", dependencies = "nvim-tree/nvim-web-devicons" },
        },
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")
            local tabnine = require("cmp_tabnine.config")
            local compare = require("cmp.config.compare")
            local tabnine_compare = require("cmp_tabnine.compare")
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")

            tabnine:setup({
                sort = true,
                max_lines = 1000,
                max_num_results = 10,
                snippet_placeholder = " ",
                run_on_every_keystroke = true,
                show_prediction_strength = false,
            })

            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),

                    -- Scroll the documentation window if visible.
                    ["<C-j>"] = cmp.mapping.scroll_docs(4),
                    ["<C-k>"] = cmp.mapping.scroll_docs(-4),

                    ["<C-Space>"] = cmp.mapping.complete(), -- Invoke completion.

                    ["<C-l>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-h>"] = cmp.mapping.abort(),
                }),
                sources = cmp.config.sources({
                    { name = "cmp_tabnine" },
                    { name = "nvim_lsp" },
                    { name = "vsnip" }, -- For vsnip users.
                }, {
                    { name = "buffer", keyword_length = 3 },
                }),
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = lspkind.cmp_format({
                        maxwidth = 80,
                        mode = "text",
                        before = function(entry, vim_item)
                            -- Set symbols
                            vim_item.kind = ({
                                Text = " ",
                                Method = " ",
                                Function = " ",
                                Constructor = " ",
                                Field = " ",
                                Variable = " ",
                                Class = " ",
                                Interface = " ",
                                Module = " ",
                                Property = " ",
                                Unit = " ",
                                Value = " ",
                                Enum = " ",
                                Keyword = " ",
                                Snippet = " ",
                                Color = " ",
                                File = " ",
                                Reference = " ",
                                Folder = " ",
                                EnumMember = " ",
                                Constant = " ",
                                Struct = " ",
                                Event = " ",
                                Operator = " ",
                                TypeParameter = " ",
                            })[vim_item.kind]

                            -- Set source name
                            vim_item.menu = ({
                                cmp_tabnine = "[AI]",
                                nvim_lsp = "[LSP]",
                                vsnip = "[VSnip]",
                                buffer = "[Buffer]",
                                cmdline = "[CMD]",
                                path = "[Path]",
                            })[entry.source.name]

                            -- Tabnine custom symbol and type
                            if entry.source.name == "cmp_tabnine" then
                                vim_item.kind = " "

                                if (entry.completion_item.data or {}).multiline then
                                    vim_item.menu = "[AI - ML]"
                                end
                            end

                            return vim_item
                        end,
                    }),
                },
                window = {
                    completion = {
                        border = "rounded",
                        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                    },
                    documentation = {
                        border = "rounded",
                        scrollbar = true,
                        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                    },
                },
                sorting = {
                    priority_weight = 2,
                    comparators = {
                        tabnine_compare,
                        compare.exact,
                        compare.recently_used,
                        compare.offset,
                        compare.score,
                        compare.kind,
                        compare.sort_text,
                        compare.length,
                        compare.order,
                    },
                },
                experimental = {
                    ghost_text = true,
                    native_menu = false,
                },
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
        end,
    },
}
