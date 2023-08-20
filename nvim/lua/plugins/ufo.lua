local spec = {
    "kevinhwang91/nvim-ufo",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
    dependencies = { "kevinhwang91/promise-async", "nvim-treesitter/nvim-treesitter" },
}

function spec:init()
    local ufo = require("ufo")

    -- Mappings
    vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "Open All Folds" })
    vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "Close All Folds" })
    vim.keymap.set("n", "zr", ufo.openFoldsExceptKinds, { desc = "Open Fold" })
    vim.keymap.set("n", "zm", ufo.closeFoldsWith, { desc = "Close Fold" })
end

function spec:config()
    local ufo = require("ufo")

    ufo.setup({
        provider_selector = function(bufnr, filetype, buftype)
            return {'treesitter', 'indent'}
        end
    })
end

return spec
