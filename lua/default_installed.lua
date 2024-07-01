local M = {}

M.treesitter = {
	"lua",
}

M.mason = {
	"stylua",
	"gofumpt",
	"golangci-lint",
	"prettier",
	"eslint-lsp",
	"terraform-ls",
	"black",
	"jq",
	"cssls",
	"docker_compose_language_service",
}

M.mason_lspconfig = {
	"lua_ls",
	"efm",
	"gopls",
	"tsserver",
	"pyright",
	"dockerls",
	"helm_ls",
	"prismals",
	"yamlls",
}

return M
