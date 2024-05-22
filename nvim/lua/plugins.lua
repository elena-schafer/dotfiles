local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-buffer",
	"hrsh7th/vim-vsnip",
	{"EdgarAlenPoe/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons"},
	"nvim-lualine/lualine.nvim",
	"windwp/nvim-autopairs",
	"lewis6991/gitsigns.nvim",
	"voldikss/vim-floaterm",
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	{ "nvim-telescope/telescope.nvim", tag = '0.1.4', dependencies = "nvim-lua/plenary.nvim"},
	{ "folke/noice.nvim", event = "VeryLazy", dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify", } },
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	"danilamihailov/beacon.nvim",
	"stevearc/aerial.nvim",
	"RRethy/vim-illuminate",
	"ggandor/leap.nvim",
	"elihunter173/dirbuf.nvim",
	"mfussenegger/nvim-jdtls",
	"aznhe21/actions-preview.nvim",
  {
			'stevearc/oil.nvim',
			opts = {},
			-- Optional dependencies
			dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
			"vhyrro/luarocks.nvim",
			priority = 1000,
			config = true,
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		event = {
      "BufReadPre " .. vim.fn.expand "~" .. "/notes/**.md",
      "BufNewFile " .. vim.fn.expand "~" .. "/notes/**.md",
    },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh8th/nvim-cmp",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter",
		},
	},
	{ "aserowy/tmux.nvim", config = function() return require("tmux").setup() end },
})
