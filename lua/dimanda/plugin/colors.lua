function InitMyColor()
	-- local color = "github_dark_dimmed"
	-- local color = "okcolors"
	-- local color = 'onedark_vivid'
	-- local color = "gruvbox"
	local color = "rose-pine"

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

	require("rose-pine").setup({
		variant = "auto", -- auto, main, moon, or dawn
		dark_variant = "main", -- main, moon, or dawn
		dim_inactive_windows = false,
		extend_background_behind_borders = true,

		enable = {
			terminal = true,
			legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
			migrations = true, -- Handle deprecated options automatically
		},

		styles = {
			bold = true,
			italic = true,
			transparency = false,
		},

		groups = {
			border = "muted",
			link = "iris",
			panel = "surface",

			error = "love",
			hint = "iris",
			info = "foam",
			note = "pine",
			todo = "rose",
			warn = "gold",

			git_add = "foam",
			git_change = "rose",
			git_delete = "love",
			git_dirty = "rose",
			git_ignore = "muted",
			git_merge = "iris",
			git_rename = "pine",
			git_stage = "iris",
			git_text = "rose",
			git_untracked = "subtle",

			h1 = "iris",
			h2 = "foam",
			h3 = "rose",
			h4 = "gold",
			h5 = "pine",
			h6 = "foam",
		},

		palette = {
			main = {
				base = "#18191a",
				overlay = "#363738",
			},
		},

		highlight_groups = {
			-- Comment = { fg = "foam" },
			-- VertSplit = { fg = "muted", bg = "muted" },
		},

		before_highlight = function(group, highlight, palette)
			-- Disable all undercurls
			-- if highlight.undercurl then
			--     highlight.undercurl = false
			-- end
			--
			-- Change palette colour
			-- if highlight.fg == palette.pine then
			--     highlight.fg = palette.foam
			-- end
		end,
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
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
}
