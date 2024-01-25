-- Setup nvim-tree window and other non-essential windows auto closing when all other windows in tab are closed
local function close_nvim_tree_on_exit(data)

	-- determine if we should close nvim-tree here
	-- If no other buffers are active, and none are modified, we close
	local should_close = 1
--	local buffers = vim.fn.getbufinfo()
--	for i=1,#buffers,1 do
--		if buffers[i].hidden == 0 or buffers[i].changed == 1 then
--			should_close = 0
--			break
--		end
--	end
	local windows = vim.fn.getwininfo()
	local non_essential_count = 0 
	--print(#windows)
	for i, win in pairs(windows) do
		if vim.bo[vim.api.nvim_win_get_buf(win.winid)].filetype ~= "" then
			non_essential_count = non_essential_count + 1
		end
	end
	--print(non_essential_count)

	if #windows == non_essential_count then
		if require("nvim-tree.api").tree.is_visible() then
			require("nvim-tree.api").tree.close_in_this_tab()
		end
	end
end

vim.api.nvim_create_autocmd({ "QuitPre" }, { callback = close_nvim_tree_on_exit })
