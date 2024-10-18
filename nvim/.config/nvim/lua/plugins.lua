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
	---------------------------------------
	-- Absolute essentials
	---------------------------------------
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", },
  {
			"stevearc/oil.nvim",
			opts = {},
			-- Optional dependencies
			dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = 'make' },
	{ "nvim-telescope/telescope.nvim", tag = "0.1.4", dependencies = "nvim-lua/plenary.nvim"},
	{
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
	},

	---------------------------------------
	-- LSP
	---------------------------------------
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "L3MON4D3/LuaSnip" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/vim-vsnip" },
	{ "aznhe21/actions-preview.nvim" },

	---------------------------------------
	-- Debug
	---------------------------------------
	{ "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },

	---------------------------------------
	-- Convenience 
	---------------------------------------
	{ "nvim-treesitter/nvim-treesitter-textobjects" }, --this one must be after treesitter
	{ "windwp/nvim-autopairs" },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{ "lewis6991/gitsigns.nvim" },
  {
    "numToStr/Comment.nvim",
    opts = {
        -- add any options here
    },
    lazy = false,
  },
	{ "danilamihailov/beacon.nvim" },
	{ "stevearc/aerial.nvim" },
	{ "RRethy/vim-illuminate" },
	{ "ggandor/leap.nvim" },
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "aserowy/tmux.nvim", config = function() return require("tmux").setup() end },
	{ "Bekaboo/deadcolumn.nvim" },

	---------------------------------------
	-- LaTeX
	---------------------------------------
	{
		"lervag/vimtex",
		lazy = false,     -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura_simple"
		end
	},

	---------------------------------------
	-- Aesthetics
	---------------------------------------
	{ "nvim-lualine/lualine.nvim" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "xiyaowong/transparent.nvim", lazy = false, },
	{ "folke/noice.nvim", event = "VeryLazy", dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify", } },

  ---------------------------------------
	 -- Dependencies
	 ---------------------------------------
	-- {
	-- 		"vhyrro/luarocks.nvim",
	-- 		priority = 1000,
	-- 		config = true,
	-- },

	---------------------------------------
	-- Extras
	---------------------------------------
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
			"hrsh7th/nvim-cmp",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter",
		},
	},
})
