function InitMyColor()
	local color = "github_dark_default"

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
		colors = {
			dark = { bg = "#161b22" },
		},
	})

	vim.cmd.colorscheme(color)
	require("lualine").setup({
		options = {
			icons_enabled = false,
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode", "time" },
			lualine_b = { "branch" },
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { "diff", "diagnostics", "encoding" },
			lualine_y = { "progress", "location" },
			lualine_z = {},
		},
	})
	vim.cmd.set("noshowmode")
end

return {
	{ "nvim-lualine/lualine.nvim" },
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
		config = function()
			InitMyColor()
		end,
	},
	{ "olimorris/onedarkpro.nvim" },
}
