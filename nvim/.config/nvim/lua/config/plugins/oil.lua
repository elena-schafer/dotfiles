return {
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				delete_to_trash = true,
			})
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end
	},
}
