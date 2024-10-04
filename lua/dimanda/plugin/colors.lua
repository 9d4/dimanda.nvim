function InitMyColor()
	-- local color = "github_dark_dimmed"
	-- local color = "okcolors"
	-- local color = 'onedark_vivid'
	local color = "gruvbox"

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "TelescopeFloat", { bg = "none" })

	require("github-theme").setup({
		options = {
			-- transparent = true,
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
			dark = { bg = "#262626" },
		},
	})

	require("gruvbox").setup({
		terminal_colors = true, -- add neovim terminal colors
		undercurl = true,
		underline = true,
		bold = true,
		italic = {
			strings = true,
			emphasis = true,
			comments = true,
			operators = false,
			folds = true,
		},
		strikethrough = true,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = true, -- invert background for search, diffs, statuslines and errors
		contrast = "", -- can be "hard", "soft" or empty string
		palette_overrides = {},
		overrides = {},
		dim_inactive = false,
		transparent_mode = true,
	})

	vim.cmd.colorscheme(color)
	-- require("lualine").setup({
	-- 	options = {
	-- 		icons_enabled = false,
	-- 		component_separators = { left = "|", right = "|" },
	-- 		section_separators = { left = "", right = "" },
	-- 	},
	-- 	sections = {
	-- 		lualine_a = { "mode", { "filename", path = 1 } },
	-- 		lualine_b = {},
	-- 		lualine_c = { "branch" },
	-- 		lualine_x = { "diff", "diagnostics", "encoding" },
	-- 		lualine_y = { "progress", "location" },
	-- 		lualine_z = {},
	-- 	},
	-- })
	-- vim.cmd.set("noshowmode")
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
	{ "e-q/okcolors.nvim", name = "okcolors" },
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
}
