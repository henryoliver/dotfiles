return {
    "y3owk1n/time-machine.nvim",
    cmd = {
        "TimeMachineToggle",
        "TimeMachinePurgeBuffer",
        "TimeMachinePurgeAll",
        "TimeMachineLogShow",
        "TimeMachineLogClear",
    },
    opts = {},
    keys = {
        { "<Leader>ut", "<Cmd>TimeMachineToggle<CR>", desc = "Toggle Tree" },
        { "<Leader>ux", "<Cmd>TimeMachinePurgeBuffer<CR>", desc = "Purge buffer" },
        { "<Leader>uX", "<Cmd>TimeMachinePurgeAll<CR>", desc = "Purge all" },
        { "<Leader>ul", "<Cmd>TimeMachineLogShow<CR>", desc = "Show log" },
    },
}
