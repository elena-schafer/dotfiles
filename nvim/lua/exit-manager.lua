-- Setup nvim-tree window and other non-essential windows auto closing when all other windows in tab are closed
local function close_nvim_tree_on_exit(data)

	-- determine if we should close nvim-tree here
	local windows = vim.fn.getwininfo()
	local non_essential_count = 1 --currently closing window counts as 1


	-- NOTE: this must be updated whenever some plugin or something adds a new window or else closing won't work smoothly
	for i, win in pairs(windows) do
		--print("test " .. vim.bo[vim.api.nvim_win_get_buf(win.winid)].filetype)
		if vim.bo[vim.api.nvim_win_get_buf(win.winid)].filetype == "noice" then
			non_essential_count = non_essential_count + 1
		end
		if vim.bo[vim.api.nvim_win_get_buf(win.winid)].filetype == "notify" then
			non_essential_count = non_essential_count + 1
		end
		if vim.bo[vim.api.nvim_win_get_buf(win.winid)].filetype == "NvimTree" then
			non_essential_count = non_essential_count + 1
		end
		if vim.bo[vim.api.nvim_win_get_buf(win.winid)].filetype == "aerial" then
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

--[[
]]--
function check_win_names()
	for i, win in pairs(vim.fn.getwininfo()) do
		print(vim.bo[vim.api.nvim_win_get_buf(win.winid)].filetype)
	end
end
