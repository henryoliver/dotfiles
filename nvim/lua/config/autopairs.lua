require("nvim-autopairs").setup({
    check_ts = true,
    ts_config = {
        javascript = { "template_string" },
    },
    enable_check_bracket_line = false,
})
