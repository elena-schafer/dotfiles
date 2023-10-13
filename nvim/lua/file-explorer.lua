-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup({
 -- on_attach = function()
 --   
 -- end,
  disable_netrw = true,
  hijack_cursor = true,
})

-- we must manually script startup on open
local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  -- open the tree
  require("nvim-tree.api").tree.toggle({ focus = false })
end

-- setup start on open
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
-- setup start on new tab
vim.api.nvim_create_autocmd({ "TabNew" }, { callback = open_nvim_tree })

-- Setup nvim-tree window auto closing when all buffers in tab are closed
local function close_nvim_tree_on_exit(data)

	-- determine if we should close nvim-tree here
	-- If no other buffers are active, and none are modified, we close
	local should_close = 1
	local buffers = vim.fn.getbufinfo()
	for i=1,#buffers,1 do
		if buffers[i].hidden == 0 or buffers[i].changed == 1 then
			should_close = 0
			break
		end
	end
  
	if require("nvim-tree.api").tree.is_visible() and should_close then
		require("nvim-tree.api").tree.close_in_this_tab()
	end
end

vim.api.nvim_create_autocmd({ "QuitPre" }, { callback = close_nvim_tree_on_exit })
