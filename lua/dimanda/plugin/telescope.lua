return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	requires = { { "nvim-lua/plenary.nvim" } },
	enabled = not vim.g.vscode, -- Disable Telescope when running in VSCode
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
				},
			},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		vim.keymap.set("n", "<leader>pg", builtin.git_files, {})
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
	end,
}
