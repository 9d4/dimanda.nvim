local util = require("formatter.util")
local defaults = require("formatter.defaults")

local jsts = {
	-- require("formatter.defaults.prettiereslint"),
	require("formatter.defaults.prettier"),
	-- require("formatter.defaults.eslint_d"),
	-- function()
	-- 	return {
	-- 		exe = "prettierd",
	-- 		args = { vim.api.nvim_buf_get_name(0) },
	-- 		stdin = true,
	-- 	}
	-- end,
}

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
			function()
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},
		javascript = jsts,
		typescript = jsts,
		html = { defaults.prettierd },
		cpp = { defaults.clangformat },
		c = { defaults.clangformat },
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	group = "FormatAutogroup",
	command = "FormatWrite",
})
