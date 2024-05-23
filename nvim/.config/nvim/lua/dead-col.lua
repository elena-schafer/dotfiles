vim.opt.colorcolumn = "100"
vim.api.nvim_create_autocmd("fileType", {
	pattern = {"markdown", "txt"},
	callback = function (opts)
		vim.opt.colorcolumn = "0"
	end
})
