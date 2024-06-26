return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"nvimdev/lspsaga.nvim",
	},
	config = function()
		require("mason").setup({
			ensure_installed = {
				"tflint",
				"golanci-lint",
				"stylua",
				"luacheck",
			},
			automatic_installation = true,
		})

		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"tsserver",
				"pyright",
				"gopls",
				"terraformls",
			},
			automatic_installation = true,
		})

		require("lspsaga").setup({
			lightbulb = {
				virtual_text = true,
				sign = true,
			},
		})

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

		-- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
			}, {
				{ name = "buffer" },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})

		-- Set up lspconfig.
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Adding capabilities to all servers mentioned above
		mason_lspconfig.setup_handlers({

			function(server)
				require("lspconfig")[server].setup({
					capabilities = capabilities,
				})
			end,
		})
		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		vim.keymap.set(
			"n",
			"<leader>le",
			vim.diagnostic.open_float,
			{ silent = true, desc = "[L]sp Diagnostic - Open Float" }
		)
		vim.keymap.set(
			"n",
			"[d",
			"<CMD>Lspsaga diagnostic_jump_prev<CR>",
			{ silent = true, desc = "[L]sp Diagnostic - Jump Previous" }
		)
		vim.keymap.set(
			"n",
			"]d",
			"<CMD>Lspsaga diagnostic_jump_next<CR>",
			{ silent = true, desc = "[L]sp Diagnostic - Jump Next" }
		)
		vim.keymap.set(
			"n",
			"<space>q",
			vim.diagnostic.setloclist,
			{ silent = true, desc = "[L]sp Diagnostic - Send to QuickFix list" }
		)

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }

				vim.keymap.set(
					"n",
					"gD",
					vim.lsp.buf.declaration,
					{ desc = "[L]SP Show buffer Declarations", buffer = ev.buf }
				)

				vim.keymap.set("n", "K", "<CMD>Lspsaga hover_doc<CR>", { desc = "[L]SP Hover", buffer = ev.buf })

				vim.keymap.set(
					"n",
					"gi",
					vim.lsp.buf.implementation,
					{ desc = "LSP [G]oto [I]mplementation", buffer = ev.buf }
				)

				vim.keymap.set(
					"n",
					"<leader>lsh",
					vim.lsp.buf.signature_help,
					{ desc = "[L]SP [S]ignature [H]elp", buffer = ev.buf }
				)

				vim.keymap.set(
					"n",
					"<space>laf",
					vim.lsp.buf.add_workspace_folder,
					{ desc = "[L]SP [A]dd Workspace [F]older", buffer = ev.buf }
				)

				vim.keymap.set(
					"n",
					"<space>lrf",
					vim.lsp.buf.remove_workspace_folder,
					{ desc = "[L]SP [R]emove Workspace [F]older", buffer = ev.buf }
				)

				vim.keymap.set("n", "<space>lwl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, { desc = "[L]SP List Workspace Folders", buffer = ev.buf })

				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "[LSP] Rename", buffer = ev.buf })

				vim.keymap.set(
					{ "n", "v" },
					"<space>lca",
					vim.lsp.buf.code_action,
					{ desc = "[L]SP [C]ode [A]ctions", buffer = ev.buf }
				)

				vim.keymap.set("n", "<space>lf", function()
					vim.lsp.buf.format({ async = true })
				end, { desc = "[L]SP [F]ormat", buffer = ev.buf })
			end,
		})
	end,
}
