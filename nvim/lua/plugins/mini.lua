local spec = {
    "echasnovski/mini.nvim",
    version = false,
    event = "InsertCharPre",
}

function spec:config()
  local icons = require("nvim-nonicons")
  local pairs = require("mini.pairs")
  local surround = require("mini.surround")
  local comment = require("mini.comment")
  local bracketed = require("mini.bracketed")
  local splitjoin = require("mini.splitjoin")
  local clue = require("mini.clue")

  pairs.setup({
    modes = { insert = true, command = false, terminal = false },
    mappings = {
      ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
      ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
      ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
      [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
      ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
      ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
      ["\""] = {
        action = "closeopen",
        pair = "\"\"",
        neigh_pattern = "[^\\].",
        register = { cr = false },
      },
      ["'"] = {
        action = "closeopen",
        pair = "''",
        neigh_pattern = "[^%a\\].",
        register = { cr = false },
      },
      ["`"] = {
        action = "closeopen",
        pair = "``",
        neigh_pattern = "[^\\].",
        register = { cr = false },
      },
      ["<"] = {
        action = "closeopen",
        pair = "<>",
        neigh_pattern = "[^\\].",
        register = { cr = false },
      },
    },
  })

  surround.setup({
    custom_surroundings = nil,
    highlight_duration = 500,
    mappings = {
      add = "sa",
      delete = "sd",
      find = "sf",
      find_left = "sF",
      highlight = "sh",
      replace = "sr",
      update_n_lines = "sn",
      suffix_last = "l",
      suffix_next = "n",
    },
    n_lines = 20,
    respect_selection_type = false,
    search_method = "cover",
    silent = true,
  })

  comment.setup({
    comment = "gc",

    -- Toggle comment on current line
    comment_line = "gcc",

    -- Define 'comment' textobject (like `dgc` - delete whole comment block)
    textobject = "gc",
  })

  bracketed.setup({
    -- First-level elements are tables describing behavior of a target:
    --
    -- - <suffix> - single character suffix. Used after `[` / `]` in mappings.
    --   For example, with `b` creates `[B`, `[b`, `]b`, `]B` mappings.
    --   Supply empty string `''` to not create mappings.
    --
    -- - <options> - table overriding target options.
    --
    -- See `:h MiniBracketed.config` for more info.
    buffer     = { suffix = 'b', options = {} },
    comment    = { suffix = 'c', options = {} },
    conflict   = { suffix = 'x', options = {} },
    diagnostic = { suffix = 'd', options = {} },
    file       = { suffix = 'f', options = {} },
    indent     = { suffix = 'i', options = {} },
    jump       = { suffix = 'j', options = {} },
    location   = { suffix = 'l', options = {} },
    oldfile    = { suffix = 'o', options = {} },
    quickfix   = { suffix = 'q', options = {} },
    treesitter = { suffix = 't', options = {} },
    undo       = { suffix = 'u', options = {} },
    window     = { suffix = 'w', options = {} },
    yank       = { suffix = 'y', options = {} },
  })

  splitjoin.setup({
    mappings = {
        toggle = 'gS',
        split = '',
        join = '',
    },
  })

  clue.setup({
    triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<leader>' },
        { mode = 'x', keys = '<leader>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
      },

      clues = {
        { mode = 'n', keys = '<leader>s', desc = icons.get("plus") .. 'Search' },
        { mode = 'n', keys = '<leader>f', desc = icons.get("plus") .. 'Find & Replace' },

        { mode = 'n', keys = '<leader>l', desc = icons.get("plus") .. 'LSP' },
        { mode = 'n', keys = '<leader>p', desc = icons.get("plus") .. 'LSP Preview' },

        clue.gen_clues.g(),
        clue.gen_clues.windows(),
        clue.gen_clues.z(),
      },
  })
end

return spec
