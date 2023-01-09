local cmp = require("cmp")
local lspkind = require("lspkind")
local tabnine = require("cmp_tabnine.config")

local compare = require("cmp.config.compare")
local tabnine_compare = require("cmp_tabnine.compare")

tabnine:setup({
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = " ",
    show_prediction_strength = true,
})

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(), -- Select the next item. Set count with large number to select pagedown.
        ["<C-p>"] = cmp.mapping.select_prev_item(), -- Select the previous item. Set count with large number to select pageup.

        -- Scroll the documentation window if visible.
        ["<C-j>"] = cmp.mapping.scroll_docs(4),
        ["<C-k>"] = cmp.mapping.scroll_docs(-4),

        ["<C-Space>"] = cmp.mapping.complete(), -- Invoke completion.

        ["<C-l>"] = cmp.mapping.confirm({ select = true }), -- Accepts the currently selected completion item.
        ["<C-h>"] = cmp.mapping.abort(), -- Closes the completion menu and restore the current line to the state before the current completion was started.
    }),
    sources = cmp.config.sources({
        { name = "cmp_tabnine" },
    }, {
        { name = "nvim_lsp" },
        { name = "vsnip" }, -- For vsnip users.
        { name = "buffer" },
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = "text_symbol",
            maxwidth = 80,
            ellipsis_char = " ",
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
                local menu = ({
                    cmp_tabnine = "[AI  ]",
                    nvim_lsp = "[LSP]",
                    vsnip = "[VSnip]",
                    buffer = "[Buffer]",
                    cmdline = "[CMD]",
                    path = "[Path]",
                })[entry.source.name]

                if entry.source.name == "cmp_tabnine" then
                    local detail = (entry.completion_item.data or {}).detail

                    vim_item.kind = " "

                    if detail and detail:find(".*%%.*") then
                        vim_item.kind = vim_item.kind .. " " .. detail
                    end

                    if (entry.completion_item.data or {}).multiline then
                        vim_item.kind = vim_item.kind .. " " .. "[AI  - ML]"
                    end
                end

                vim_item.menu = menu

                return vim_item
            end,
        }),
    },
    sorting = {
        priority_weight = 2,
        comparators = {
            tabnine_compare,
            compare.offset,
            compare.exact,
            compare.score,
            compare.recently_used,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
        },
    },
    experimental = { native_menu = false, ghost_text = true },
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
