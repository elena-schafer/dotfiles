return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			integrations = {
				mason = true,

			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme "catppuccin"
		end
	},
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		config = function()
			vim.cmd.TransparentEnable()
		end
	},
}
