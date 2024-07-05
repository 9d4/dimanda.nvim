function InitMyColor(color)
	-- color = color or "rose-pine"
	color = color or "github_dark_default"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "TelescopeFloat", { bg = "none" })
end

InitMyColor()
