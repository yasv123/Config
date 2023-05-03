-- This file can be loaded by calling `lua require('packer')` from your init.lua

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the packer.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}


-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use 'lewis6991/impatient.nvim' -- Pluging loading optimizer

	use "nvim-lua/popup.nvim"   -- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins

	use "numToStr/Comment.nvim"

	use 'nvim-lualine/lualine.nvim'

	use "natecraddock/workspaces.nvim"
	use "natecraddock/sessions.nvim"

	use 'goolord/alpha-nvim'

	use "folke/which-key.nvim"

	use "github/copilot.vim"

	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	-- Bufferline
	use 'akinsho/bufferline.nvim'
	use 'moll/vim-bbye'

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- Toggle Term
	use 'akinsho/toggleterm.nvim'

	-- Color Schemes
	use({ 'rose-pine/neovim', as = 'rose-pine' })
	use({ "bluz71/vim-nightfly-colors", as = "nightfly" })
	use({ "bluz71/vim-moonfly-colors", as = "moonfly" })
	use 'folke/tokyonight.nvim'

	-- Tree Sitter
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use 'p00f/nvim-ts-rainbow'
	use 'JoosepAlviste/nvim-ts-context-commentstring'

	-- Harpoon
	use('theprimeagen/harpoon')

	-- Git Signs
	use('lewis6991/gitsigns.nvim')

	-- Undotree
	use('mbbill/undotree')

	-- Fugitive
	use('tpope/vim-fugitive')

	-- DAP
	use('mfussenegger/nvim-dap')

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },    -- Required
			{ 'williamboman/mason.nvim' },  -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'hrsh7th/cmp-buffer' }, -- Optional
			{ 'hrsh7th/cmp-path' }, -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' }, -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },    -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		}
	}

	-- Surround
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	})

	-- NVIM Tree
	use('nvim-tree/nvim-tree.lua')
	use('nvim-tree/nvim-web-devicons')

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
