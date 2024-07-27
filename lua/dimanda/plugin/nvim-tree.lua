return {
	"nvim-tree/nvim-tree.lua",
	-- event = 'BufEnter',
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local glyphs = {}

		require("nvim-web-devicons").setup({
			-- your personal icons can go here (to override)
			-- you can specify color or cterm_color instead of specifying both of them
			-- DevIcon will be appended to `name`
			override = {
				zsh = {
					icon = "",
					color = "#428850",
					cterm_color = "65",
					name = "Zsh",
				},
			},
			-- globally enable default icons (default to false)
			-- will get overriden by `get_icons` option
			default = true,
		})

		glyphs.git = {
			unstaged = "",
			staged = "",
			unmerged = "",
			renamed = "",
			untracked = "",
			deleted = "",
			ignored = "",
		}

		require("nvim-tree").setup({
			diagnostics = { enable = true },
			view = {
				width = 30,
				side = "left",
				signcolumn = "yes",
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 500,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			renderer = {
				group_empty = true,
				highlight_opened_files = "all",
				special_files = {},
				root_folder_modifier = ":p:~",
				icons = {
					glyphs = glyphs,
				},
			},
		})

		-- Mappings
		vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle, { silent = true })
	end,
}
