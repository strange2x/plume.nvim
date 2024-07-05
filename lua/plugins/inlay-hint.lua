return {
	"felpafel/inlay-hint.nvim",
	event = "LspAttach",
	config = function()
		require("inlay-hint").setup()
	end,
}
