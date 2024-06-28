local M = {}

M.treesitter = {
	"lua",
}

M.mason = {
	"stylua",
	"gofumpt",
	"golangci-lint",
}

M.mason_lspconfig = {
	"lua_ls",
	"efm",
	"gopls",
}

return M
