local fn = vim.fn

-- Automatically install Packer if missing
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand to reload Neovim after saving plugins.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Initialize Packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Plugin list
packer.startup(function(use)
	use({
		"wbthomason/packer.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
		"sheerun/vim-polyglot",
		"folke/tokyonight.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"kevinhwang91/nvim-bqf",
		"nvim-pack/nvim-spectre",
		"kevinhwang91/rnvimr",
		"stevearc/conform.nvim",
		"mfussenegger/nvim-lint",
	})
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
