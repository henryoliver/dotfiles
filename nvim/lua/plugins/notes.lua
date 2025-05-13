return {
    ---@type LazySpec
    "backdround/global-note.nvim",
    opts = {
        -- Filename to use for default note (preset).
        -- string or fun(): string
        filename = "notes.md",

        -- Directory to keep default note (preset).
        -- string or fun(): string
        directory = vim.fn.stdpath("config") .. "/notes/",

        -- Floating window title.
        -- string or fun(): string
        title = "Notes",

        -- Ex command name.
        -- string
        command_name = "Notes",

        -- A nvim_open_win config to show float window.
        -- table or fun(): table
        window_config = function()
            local window_height = vim.api.nvim_list_uis()[1].height
            local window_width = vim.api.nvim_list_uis()[1].width
            return {
                relative = "editor",
                border = "rounded",
                title = "Notes",
                title_pos = "center",
                width = math.floor(0.8 * window_width),
                height = math.floor(0.8 * window_height),
                row = math.floor(0.05 * window_height),
                col = math.floor(0.1 * window_width),
            }
        end,

        -- It's called after the window creation.
        -- fun(buffer_id: number, window_id: number)
        post_open = function(_, _) end,
    },
    keys = {
        { "<Leader>n", "<Cmd>Notes<CR>", desc = "Notes" },
    },
}
