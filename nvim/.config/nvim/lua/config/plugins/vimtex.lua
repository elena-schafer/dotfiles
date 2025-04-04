return {
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura_simple"
			vim.g.vimtex_quickfix_open_on_warning = 0
			vim.g.vimtex_quickfix_ignore_filters = { 'Underfull \\hbox', 'Overfull \\hbox', }
		end
	},
}
