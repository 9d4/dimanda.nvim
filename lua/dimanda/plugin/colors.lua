function InitMyColor(color)
	-- color = color or "rose-pine"
	-- color = color or "github_dark_default"
	-- require("github-theme").setup({
	-- 	vim.cmd.colorscheme(color),
	-- })

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "TelescopeFloat", { bg = "none" })

	require("onedarkpro").setup({
		highlights = {
			Comment = { italic = true },
			Directory = { bold = true },
			ErrorMsg = { italic = true, bold = true },
		},
	})
	require("onedarkpro").setup({
		styles = {
			types = "NONE",
			methods = "NONE",
			numbers = "NONE",
			strings = "NONE",
			comments = "italic",
			keywords = "bold,italic",
			constants = "NONE",
			functions = "italic",
			operators = "NONE",
			variables = "NONE",
			parameters = "NONE",
			conditionals = "italic",
			virtual_text = "NONE",
		},
	})

	vim.cmd.colorscheme("onedark_dark")
end

InitMyColor()
