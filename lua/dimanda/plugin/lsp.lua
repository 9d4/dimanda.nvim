local lsp_zero = require("lsp-zero")
local lsp_format = require("lsp-format")

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "tsserver", "lua_ls" },
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
})

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

lsp_zero.setup()
cmp.setup({
	sources = {
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
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})

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
