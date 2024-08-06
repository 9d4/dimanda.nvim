function InitMyColor()
	-- local color = "github_dark_default"
	local color = "okcolors"

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "TelescopeFloat", { bg = "none" })

	require("github-theme").setup({
		options = {
			transparent = true,
		},
	})

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
			lualine_a = { "mode", { "filename", path = 1 } },
			lualine_b = {},
			lualine_c = { "branch" },
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
	{ "gmr458/cold.nvim" },
	{ "backdround/melting" },
	{ "doums/espresso.nvim" },
    { "e-q/okcolors.nvim", name = "okcolors" }
}
