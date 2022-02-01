local cmp = require('cmp')
local lspkind = require('lspkind')

local source_mapping = {
    cmp_tabnine = '[AI]',
    nvim_lsp = '[LSP]',
    vsnip = '[snip]',
    buffer = '[buffer]',
    path = '[path]',
}

local compare = require('cmp.config.compare')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
        end,
    },
    mapping = {
        ['<C-l>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
    },
    sources = cmp.config.sources({
        { name = 'cmp_tabnine' },
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
    }, {
        { name = 'buffer' },
    }),
    formatting = {
        format = function(entry, vim_item)
            local menu = source_mapping[entry.source.name]

            vim_item.kind = lspkind.presets.default[vim_item.kind]

            if entry.source.name == 'cmp_tabnine' then
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    menu = entry.completion_item.data.detail .. ' ' .. menu
                end

                vim_item.kind = ''
            end

            vim_item.menu = menu

            return vim_item
        end,
    },
    sorting = {
        priority_weight = 2,
        comparators = {
            require('cmp_tabnine.compare'),
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
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' },
    },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' },
    }),
})
