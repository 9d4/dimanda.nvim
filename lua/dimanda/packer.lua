-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("dimanda.plugin.telescope")
		end,
	})

	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			-- require('lualine').setup({ options = { theme = 'auto' } })
		end,
	})

	-- Spider w,e,b motions
	use({
		"chrisgrieser/nvim-spider",
		event = "BufRead",
		config = function()
			require("dimanda.plugin.nvim-spider")
		end,
	})

	-- Nvim tree
	use({
		"nvim-tree/nvim-tree.lua",
		-- event = 'BufEnter',
		requires = { "nvim-tree/nvim-web-devicons", "projekt0n/circles.nvim" },
		config = function()
			require("dimanda.plugin.nvim-tree")
		end,
	})

	-- themes
	-- use({
	--     "rose-pine/neovim",
	--     as = "rose-pine",
	--     config = function()
	--         vim.cmd("colorscheme rose-pine-main")
	--     end
	-- })
	use({
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({
				require("dimanda.plugin.colors"),
			})
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = "TSUpdate",
		config = function()
			require("dimanda.plugin.treesitter")
		end,
	})
	-- justfile thing
	use("IndianBoy42/tree-sitter-just")

	use("nvim-lua/plenary.nvim") -- don't forget to add this one if you don't have it yet!
	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("dimanda.plugin.harpoon")
		end,
	})

	use({
		"mbbill/undotree",
		config = function()
			require("dimanda.plugin.undotree")
		end,
	})
	use({
		"tpope/vim-fugitive",
		config = function()
			require("dimanda.plugin.fugitive")
		end,
	})

	-- LSP things
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--- Uncomment the two plugins below if you want to manage the language servers from neovim
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "L3MON4D3/LuaSnip" },
		},
		config = function()
			require("dimanda.plugin.lsp")
		end,
	})
	use({
		"mhartington/formatter.nvim",
		config = function()
			require("dimanda.plugin.formatter")
		end,
	})
	-- use {
	--     "Issafalcon/lsp-overloads.nvim",
	--     config = function()
	--         require('dimanda.plugin.lsp-overloads')
	--     end
	-- }

	use({ "tpope/vim-abolish" })
	use({ "tpope/vim-commentary" })

	-- use {
	--     "glebzlat/arduino-nvim",
	--     config = {
	--         function() require("arduino-nvim").setup() end,
	--         filetype = "arduino",
	--     },
	--     dev = true,
	--     dir = "~/Documents/dev/neovim/Arduino.nvim"
	-- }

	-- Platform IO
	use({ "normen/vim-pio" })
end)
