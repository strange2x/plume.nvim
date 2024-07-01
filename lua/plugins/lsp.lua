local function setup_mason()
	require("mason").setup()
end

local function on_attach_lsp(client)
	local fidget = require("fidget")
	if client.name ~= "efm" then
		fidget.notification.notify("Attaching LSP -> " .. client.name)
	end
end

local function setup_lsp_servers()
	local mason_lsp = require("mason-lspconfig")
	mason_lsp.setup({
		ensure_installed = require("default_installed").mason_lspconfig,
		automatic_installation = true,
	})

	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	mason_lsp.setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
				on_attach = on_attach_lsp,
			})
		end,
	})
end

local function create_lspattach_mappings()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(e)
			vim.bo[e.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
			local default_mappings = require("config.lsp_mappings").lsp_default_keymaps
			default_mappings(e)

			-- Setup lspsaga keymaps
			vim.keymap.set(
				"n",
				"<leader>lca",
				"<cmd>Lspsaga code_action<cr>",
				{ silent = true, desc = "[L]sp [C]ode [A]ctions" }
			)
			vim.keymap.set(
				"n",
				"<leader>lbd",
				"<cmd>Lspsaga show_buf_diagnostics<cr>",
				{ silent = true, desc = "[L]sp [B]uffer [D]iagnostics", buffer = e.buf }
			)
			vim.keymap.set(
				"n",
				"<leader>lwd",
				"<cmd>Lspsaga show_workspace_diagnostics<cr>",
				{ silent = true, desc = "[L]sp [W]orkspace [D]iagnostics" }
			)
			vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", { silent = true, desc = "LSP Hover Documentation" })
			vim.keymap.set(
				"n",
				"<leader>lpd",
				"<cmd>Lspsaga peek_definition<cr>",
				{ silent = true, desc = "[L]sp [P]eek [D]efinition" }
			)
			vim.keymap.set(
				"n",
				"gd",
				"<cmd>Lspsaga goto_definition<cr>",
				{ silent = true, desc = "[L]sp Goto Definition" }
			)

			-- Diagnostics
			vim.keymap.set(
				"n",
				"<leader>[d",
				"<cmd>Lspsaga diagnostics_jump_prev<cr>",
				{ silent = true, desc = "Lsp Diagnostic Previous" }
			)
			vim.keymap.set(
				"n",
				"<leader>]d",
				"<cmd>Lspsaga diagnostics_jump_next<cr>",
				{ silent = true, desc = "Lsp Diagnostic Next" }
			)

			vim.keymap.set("n", "gR", "<cmd>Lspsaga rename<cr>", { silent = true, desc = "[L]sp Rename" })
		end,
	})
end

local function setup_cmp()
	local cmp = require("cmp")
	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" }, -- For luasnip users.
		}, {
			{ name = "buffer" },
		}),
	})

	-- Other sources
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
		matching = { disallow_symbol_nonprefix_matching = false },
	})
end

local function setup_mason_autoinstall()
	require("mason-tool-installer").setup({

		-- a list of all tools you want to ensure are installed upon
		-- start
		ensure_installed = require("default_installed").mason,
		auto_update = false,

		run_on_start = true,

		start_delay = 3000, -- 3 second delay

		debounce_hours = 5, -- at least 5 hours between attempts to install/update

		integrations = {
			["mason-lspconfig"] = true,
			["mason-null-ls"] = false,
			["mason-nvim-dap"] = false,
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "nvimdev/lspsaga.nvim", dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" } },
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		setup_cmp()
		setup_mason()
		setup_lsp_servers()
		setup_mason_autoinstall()
		create_lspattach_mappings()
		require("lspsaga").setup()

		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
	end,
}
