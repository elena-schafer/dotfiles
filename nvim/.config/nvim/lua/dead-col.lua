vim.opt.colorcolumn = "80"
vim.api.nvim_create_autocmd("fileType", {
	pattern = {"markdown", "txt"},
	callback = function (opts)
		vim.opt.colorcolumn = "0"
	end
})
