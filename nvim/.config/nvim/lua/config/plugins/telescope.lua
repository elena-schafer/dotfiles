return {
	{ "nvim-telescope/telescope-fzf-native.nvim", build = 'make' },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			local tele = require("telescope")
			tele.setup({})
			tele.load_extension("fzf")
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
			vim.keymap.set('n', '<leader>fl', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		end,
	},
}
