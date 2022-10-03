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

-- Buffers
map("n", "<Leader>x", "<Cmd>Bwipeout<CR>", default_options)
map("n", "<Leader>X", "<Cmd>bufdo! <Cmd>Bwipeout<CR>", default_options)

-- Quickly edit/reload the vimrc file
whichkey.register({
    ["<Leader>v"] = { name = "Vim" },
    ["<Leader>ve"] = { "<Cmd>e $MYVIMRC<CR>", "Edit" },
    ["<Leader>vs"] = { "<Cmd>so $MYVIMRC<CR>", "Source" },
})

-- Write (Save)
map("n", "<Leader>w", "<Cmd>update<CR>", default_options)
map("n", "<Leader>W", "<Cmd>wall<CR>", default_options)

-- Plugins

-- Trouble
whichkey.register({
    ["<Leader>t"] = { name = "Trouble" },
    ["<Leader>tt"] = { "<Cmd>TroubleToggle<CR>", "Toggle" },
    ["<Leader>tT"] = { "<Cmd>TodoTrouble<CR>", "Todos" },
    ["<Leader>tr"] = { "<Cmd>TroubleToggle lsp_references<CR>", "References LSP" },
    ["<Leader>td"] = { "<Cmd>TroubleToggle document_diagnostics<CR>", "Document LSP" },
    ["<Leader>tw"] = { "<Cmd>TroubleToggle workspace_diagnostics<CR>", "Workspace LSP" },
})

-- Nvim LspConfig
whichkey.register({
    ["<Leader>l"] = { name = "LSP Client" },
    ["<Leader>ld"] = { "<Cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Definition" },
    ["<Leader>lr"] = { "<Cmd>lua require('goto-preview').goto_preview_references()<CR>", "References" },
    ["<Leader>li"] = { "<Cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Implementation" },
    ["<Leader>lx"] = { "<Cmd>lua require('goto-preview').close_all_win()<CR>", "Close Windows" },
    ["<Leader>lh"] = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    ["<Leader>ls"] = { "<Cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature" },
    ["<Leader>la"] = { "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Action" },
    ["<Leader>ln"] = { "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    ["<Leader>lf"] = { "<Cmd>lua vim.lsp.buf.format()<CR>", "Format LSP" },
})

whichkey.register({
    ["<Leader>l"] = { name = "LSP Client" },
    ["<Leader>lf"] = { "<Cmd>lua vim.lsp.buf.range_formatting()<CR>", "Format Range" },
}, { mode = "v" })

map("n", "[g", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", default_options)
map("n", "]g", "<Cmd>lua vim.diagnostic.goto_next()<CR>", default_options)

-- Highlight-Current-N
map("n", "n", "<Plug>(highlight-current-n-n)", { noremap = false })
map("n", "N", "<Plug>(highlight-current-n-N)", { noremap = false })
map("n", "*", "*N", { noremap = false })

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
    ["<Leader>sf"] = { "<Cmd>Telescope git_files<CR>", "Project Files" },
    ["<Leader>sw"] = { "<Cmd>Telescope live_grep<CR>", "Project Words" },
    ["<Leader>sW"] = { "<Cmd>Telescope grep_string<CR>", "Project Current Word" },
    ["<Leader>sb"] = { "<Cmd>Telescope buffers<CR>", "Buffers" },
    ["<Leader>sc"] = { "<Cmd>Telescope commands<CR>", "Commands" },
    ["<Leader>sm"] = { "<Cmd>Telescope marks<CR>", "Marks" },
    ["<Leader>sr"] = { "<Cmd>Telescope registers<CR>", "Registers" },
    ["<Leader>st"] = { "<Cmd>TodoTelescope<CR>", "Todos" },
    ["<Leader>sg"] = { name = "Git" },
    ["<Leader>sgc"] = { "<Cmd>Telescope git_bcommits<CR>", "Commits" },
    ["<Leader>sgC"] = { "<Cmd>Telescope git_commits<CR>", "Project Commits" },
    ["<Leader>sgb"] = { "<Cmd>Telescope git_branches<CR>", "Branches" },
})

-- Gitsigns and Diffview
whichkey.register({
    ["<Leader>g"] = { name = "Git" },
    ["<Leader>gb"] = { "<Cmd>Gitsigns toggle_current_line_blame<CR>", "Blame Toggle" },
    ["<Leader>gh"] = { name = "Hunk" },
    ["<Leader>ghp"] = { "<Cmd>Gitsigns preview_hunk<CR>", "Hunk Preview" },
    ["<Leader>ghd"] = { "<Cmd>Gitsigns diffthis<CR>", "Hunk Diff" },
    ["<Leader>gd"] = { name = "Diff" },
    ["<Leader>gdo"] = { "<Cmd>DiffviewOpen HEAD<CR>", "Diffview" },
})

map("n", "[h", "<Plug>Gitsigns next_hunk<CR>", expr_options)
map("n", "]h", "<Plug>Gitsigns prev_hunk<CR>", expr_options)

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
