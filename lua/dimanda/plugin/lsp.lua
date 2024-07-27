return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		--- Uncomment the two plugins below if you want to manage the language servers from neovim
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "neovim/nvim-lspconfig" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "L3MON4D3/LuaSnip", version = "v2.*", dependencies = { "rafamadriz/friendly-snippets" } },
		{ "lukas-reineke/lsp-format.nvim" },
		{ "creativenull/efmls-configs-nvim", version = "v1.7.0" },
		{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
		{ "onsails/lspkind.nvim" },
	},
	config = function()
		-- Folding
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}
		local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
		for _, ls in ipairs(language_servers) do
			require("lspconfig")[ls].setup({
				capabilities = capabilities,
				-- you can add other fields for setting up lsp server in this table
			})
		end
		require("ufo").setup()

		-- LSP
		local lsp_zero = require("lsp-zero")
		local lsp_format = require("lsp-format")
		local cmp = require("cmp")
		local cmp_action = require("lsp-zero").cmp_action()

		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)

		require("luasnip.loaders.from_vscode").lazy_load()
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "tsserver", "lua_ls" },
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			},
		})

		lsp_zero.setup()
		cmp.setup({
			sources = {
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-f>"] = cmp_action.luasnip_jump_forward(),
				["<C-b>"] = cmp_action.luasnip_jump_backward(),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-p>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_prev_item({ behavior = "insert" })
					else
						cmp.complete()
					end
				end),
				["<C-n>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_next_item({ behavior = "insert" })
					else
						cmp.complete()
					end
				end),
			}),
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = require("lspkind").cmp_format({
					mode = "symbol", -- show only symbol annotations
					maxwidth = 50, -- prevent the popup from showing more than provided characters
					ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
					symbol_map = {
						-- Method = "فعل",
					},
				}),
			},
		})

		-- Formatters
		local fs = require("efmls-configs.fs")
		local prettier = {
			formatCanRange = true,
			formatCommand = string.format(
				"%s '${INPUT}' ${--range-start=charStart} ${--range-end=charEnd} "
					.. "${--tab-width=tabWidth} ${--use-tabs=!insertSpaces}",
				fs.executable("prettierd", fs.Scope.NODE)
			),
			formatStdin = true,
			rootMarkers = {
				"package.json",
				".prettierrc",
				".prettierrc.json",
				".prettierrc.js",
				".prettierrc.yml",
				".prettierrc.yaml",
				".prettierrc.json5",
				".prettierrc.mjs",
				".prettierrc.cjs",
				".prettierrc.toml",
				"prettier.config.js",
				"prettier.config.cjs",
				"prettier.config.mjs",
			},
		}
		local eslint_d = require("efmls-configs.linters.eslint_d")
		local astyle = require("efmls-configs.formatters.astyle")

		local languages = require("efmls-configs.defaults").languages()
		languages = vim.tbl_extend("force", languages, {
			-- Custom languages, or override existing ones
			html = { prettier },
			typescript = { prettier, eslint_d },
			javascript = { prettier, eslint_d },
			typescriptreact = { prettier, eslint_d },
			javascriptreact = { prettier, eslint_d },
			json = { prettier },
			lua = { require("efmls-configs.formatters.stylua") },
			go = { require("efmls-configs.formatters.gofumpt") },
			c = { astyle },
		})
		local efmls_config = {
			filetypes = vim.tbl_keys(languages),
			settings = {
				rootMarkers = { ".git/" },
				languages = languages,
			},
			init_options = {
				documentFormatting = true,
				documentRangeFormatting = true,
			},
		}

		require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {
			on_attach = lsp_format.on_attach,
		}))
	end,
}
