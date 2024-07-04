local M = {}

M.treesitter = {
	"lua",
	"vimdoc",
	"go",
	"typescript",
	"bash",
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
	"shfmt",
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

M.efmls_config = {
	-- Custom languages, or override existing ones
	html = {
		require("efmls-configs.formatters.prettier"),
	},
	lua = {
		require("efmls-configs.formatters.stylua"),
	},
	go = {
		require("efmls-configs.linters.golangci_lint"),
		require("efmls-configs.formatters.gofumpt"),
	},
	python = {
		require("efmls-configs.formatters.black"),
	},
	sh = {
		require("efmls-configs.formatters.shfmt"),
	},
}

M.efm_root_markers = { ".git/", "node_modules/" }

M.formatter_config = {
	["*"] = {
		require("formatter.filetypes.any").remove_trailing_whitespace,
	},
	["json"] = {
		require("formatter.filetypes.json").jq,
		require("formatter.filetypes.json").prettier,
	},
	["yaml"] = {
		require("formatter.filetypes.yaml").prettier,
	},
	["markdown"] = {
		require("formatter.filetypes.markdown").prettier,
	},
}

return M
