local spec = {
	"utilyre/sentiment.nvim",
	event = { "InsertCharPre", "InsertEnter" },
}

function spec:config()
	local sentiment = require("sentiment")

	sentiment.setup()
end

return spec
