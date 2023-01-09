local map = vim.api.nvim_set_keymap
local whichkey = require("which-key")

local default_options = { noremap = true, silent = true }
local expr_options = { noremap = true, expr = true, silent = true }

-- Map the leader key
vim.g.mapleader = " "

-- Use v to toggle visual mode.
map("v", "v", "<Esc>", default_options)

-- Move to beginning/end of line
map("n", "B", "^", default_options)
map("n", "E", "$", default_options)

-- Undo break points
map("i", ",", ",<C-g>u", default_options)
map("i", ".", ".<C-g>u", default_options)
map("i", "!", "!<C-g>u", default_options)
map("i", "?", "?<C-g>u", default_options)

-- Paste over currently selected text without yanking it
map("v", "p", '"_dP', default_options)

-- Quickfix list navigation
map("n", "[q", "<Cmd>cprevious<CR>", default_options)
map("n", "]q", "<Cmd>cnext<CR>", default_options)

-- Location list navigation
map("n", "[l", "<Cmd>lprevious<CR>", default_options)
map("n", "]l", "<Cmd>lnext<CR>", default_options)

-- Apply Macros with Q
-- Hit qq to record, q to stop recording, and Q to apply.
map("n", "Q", "@q", { noremap = true })
map("v", "Q", "<Cmd>norm @q<CR>", { noremap = true })

-- Quickly edit/reload the vimrc file
whichkey.register({
    ["<Leader>v"] = { name = "Config" },
    ["<Leader>ve"] = { "<Cmd>edit $MYVIMRC<CR>", "Edit Vim" },
    ["<Leader>vs"] = { "<Cmd>source $MYVIMRC<CR>", "Source Vim" },
})

-- Close Buffers
whichkey.register({ ["<Leader>x"] = { "<Cmd>Bwipeout<CR>", "Close Buffer" } })
whichkey.register({ ["<Leader>X"] = { "<Cmd>bufdo! Bwipeout<CR>", "Close All Buffers" } })

-- Write (Save) Buffers
whichkey.register({ ["<Leader>w"] = { "<Cmd>update<CR>", "Save Buffer" } })
whichkey.register({ ["<Leader>W"] = { "<Cmd>wall<CR>", "Save All Buffers" } })

-- Plugins

-- Nvim LspConfig
whichkey.register({
    ["<Leader>l"] = { name = "LSP Client" },
    ["<Leader>ld"] = { "<Cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Definition Preview" },
    ["<Leader>lt"] = {
        "<Cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
        "Type Definition Preview",
    },
    ["<Leader>lr"] = { "<Cmd>lua require('goto-preview').goto_preview_references()<CR>", "References Preview" },
    ["<Leader>li"] = { "<Cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Implementation Preview" },
    ["<Leader>lx"] = { "<Cmd>lua require('goto-preview').close_all_win()<CR>", "Close Windows" },

    ["<Leader>lh"] = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    ["<Leader>lR"] = { "<Cmd>lua vim.lsp.buf.references()<CR>", "References" },
    ["<Leader>lD"] = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
    ["<Leader>ls"] = { "<Cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature" },
    ["<Leader>lT"] = { "<Cmd>lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },

    ["<Leader>la"] = { "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Action" },

    ["<Leader>ln"] = { "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    ["<Leader>lf"] = { "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>", "Format LSP" },
})

whichkey.register({
    ["<Leader>l"] = { name = "LSP Client" },
    ["<Leader>lf"] = { "<Cmd>lua vim.lsp.buf.formatexpr()<CR>", "Format Range" },
}, { mode = "v" })

map("n", "[g", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", default_options)
map("n", "]g", "<Cmd>lua vim.diagnostic.goto_next()<CR>", default_options)

-- Trouble
whichkey.register({
    ["<Leader>t"] = { name = "Trouble" },
    ["<Leader>tt"] = { "<Cmd>TroubleToggle<CR>", "Toggle" },
    ["<Leader>tT"] = { "<Cmd>TodoTrouble<CR>", "Todos" },
    ["<Leader>tr"] = { "<Cmd>TroubleToggle lsp_references<CR>", "References LSP" },
    ["<Leader>td"] = { "<Cmd>TroubleToggle document_diagnostics<CR>", "Document LSP" },
    ["<Leader>tw"] = { "<Cmd>TroubleToggle workspace_diagnostics<CR>", "Workspace LSP" },
})

-- Nvim Magic
whichkey.register({
    ["<Leader>m"] = { name = "Nvim Magic" },
    ["<Leader>mc"] = { "<Plug>nvim-magic-append-completion<CR>", "Fetch and append completion" },
    ["<Leader>ma"] = { "<Plug>nvim-magic-suggest-alteration<CR>", "Ask for an alteration" },
    ["<Leader>md"] = { "<Plug>nvim-magic-suggest-docstring<CR>", "Generate a docstring" },
}, { mode = "v" })

-- Nvim-spectre
whichkey.register({
    ["<Leader>f"] = { name = "Find & Replace" },
    ["<Leader>fp"] = { "<Cmd>lua require('spectre').open()<CR>", "Project-Wide" },
    ["<Leader>fb"] = { "<Cmd>lua require('spectre').open_file_search()<CR>", "Buffer" },
    ["<Leader>fw"] = { "<Cmd>lua require('spectre').open_visual({ select_word = true })<CR>", "Current Word" },
})

whichkey.register({
    ["<Leader>f"] = { name = "Find & Replace" },
    ["<Leader>fw"] = { "<Cmd>lua require('spectre').open_visual()<CR>", "Word" },
}, { mode = "v" })

-- Telescope
whichkey.register({
    ["<Leader>s"] = { name = "Search" },
    -- Words
    ["<Leader>sw"] = { "<Cmd>Telescope live_grep<CR>", "Project Words" },
    ["<Leader>sW"] = { "<Cmd>Telescope grep_string<CR>", "Project Current Word" },
    ["<Leader>sx"] = { "<Cmd>Telescope current_buffer_fuzzy_find<CR>", "Current Buffer Words" },

    -- Files
    ["<Leader>sf"] = { "<Cmd>Telescope git_files<CR>", "Git Files" },
    ["<Leader>sF"] = { "<Cmd>Telescope find_files<CR>", "Project Files" },

    -- Others
    ["<Leader>sm"] = { "<Cmd>Telescope marks<CR>", "Marks" },
    ["<Leader>sb"] = { "<Cmd>Telescope buffers<CR>", "Buffers" },
    ["<Leader>sr"] = { "<Cmd>Telescope registers<CR>", "Registers" },
})

-- Git
whichkey.register({
    ["<Leader>g"] = { name = "Git" },
    ["<Leader>go"] = { "<Cmd>Neogit<CR>", "Neogit" },
    ["<Leader>gb"] = { "<Cmd>Gitsigns toggle_current_line_blame<CR>", "Blame Toggle" },

    ["<Leader>gh"] = { name = "Hunk" },
    ["<Leader>ghp"] = { "<Cmd>Gitsigns preview_hunk<CR>", "Hunk Preview" },
    ["<Leader>ghd"] = { "<Cmd>Gitsigns diffthis<CR>", "Hunk Diff" },
    ["<Leader>ghr"] = { "<Cmd>Gitsigns reset_hunk<CR>", "Reset Hunk" },
    ["<Leader>ght"] = { "<Cmd>Gitsigns setqflist<CR>", "Open Trouble List" },

    ["<Leader>gd"] = { name = "Diffview" },
    ["<Leader>gdo"] = { "<Cmd>DiffviewOpen<CR>", "Merge Tool" },
    ["<Leader>gdh"] = { "<Cmd>DiffviewFileHistory<CR>", "File History Branch" },
    ["<Leader>gdf"] = { "<Cmd>DiffviewFileHistory %<CR>", "File History File" },
    ["<Leader>gdx"] = { "<Cmd>DiffviewClose<CR>", "Close the current diffview" },

    ["<Leader>gl"] = { name = "Link" },
    ["<Leader>glh"] = {
        "<Cmd>lua require('gitlinker').get_repo_url({ action_callback = require('gitlinker.actions').open_in_browser })<CR>",
        "Home URL",
    },
    ["<Leader>gll"] = {
        "<Cmd>lua require('gitlinker').get_buf_range_url('n', { action_callback = require('gitlinker.actions').open_in_browser })<CR>",
        "Buffer Line URL",
    },
})

whichkey.register({
    ["<Leader>g"] = { name = "Git" },
    ["<Leader>gl"] = { name = "Link" },
    ["<Leader>gll"] = {
        "<Cmd>lua require('gitlinker').get_buf_range_url('n', { action_callback = require('gitlinker.actions').open_in_browser })<CR>",
        "Buffer Line URL",
    },
}, { mode = "v" })

map("n", "[h", "<Cmd>Gitsigns next_hunk<CR>", expr_options)
map("n", "]h", "<Cmd>Gitsigns prev_hunk<CR>", expr_options)

-- Zen Mode
whichkey.register({ ["<Leader>z"] = { "<Cmd>ZenMode<CR>", "ZenMode" } })

-- Rnvimr
whichkey.register({ ["<Leader>r"] = { "<Cmd>RnvimrToggle<CR>", "Ranger" } })

-- Nvim Tree
whichkey.register({ ["<Leader>e"] = { "<Cmd>NvimTreeToggle<CR>", "NvimTree" } })

-- Bufferline
map("n", "[b", "<Cmd>BufferLineCyclePrev<CR>", default_options)
map("n", "]b", "<Cmd>BufferLineCycleNext<CR>", default_options)
map("n", "[t", "<Cmd>BufferLineMovePrev<CR>", default_options)
map("n", "]t", "<Cmd>BufferLineMoveNext<CR>", default_options)
