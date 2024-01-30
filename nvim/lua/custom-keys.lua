local map = vim.api.nvim_set_keymap

-- Nvim-Tree keybinds
map('n', '<C-n>', [[:NvimTreeToggle<CR>]], {})

--BufferLine keybinds
map('n', '[b', [[:BufferLineCyclePrev<CR>]], {})
map('n', ']b', [[:BufferLineCycleNext<CR>]], {})
map('n', '<leader>bp', [[:BufferLineTogglePin<CR>]], {})
function closeBuffer () 
	vim.api.nvim_buf_delete(0, {})
	--local bufferline = require('bufferline')
	--if (#bufferline.get_elements().elements == 1) then
	--end
end
--map('n', '<leader>q', [[:e#<bar>bd #<CR>]], {}) --change to more complex function to allow closing nvim when all edit buffers are closed
						--currently just reopens the alternative file
vim.keymap.set('n', '<leader>q', closeBuffer, {})

--floaterm keybinds
--map('n', '<leader>ft', [[:FloatermNew<CR>]], {})
map('n', '<leader>t', [[:FloatermToggle<CR>]], {})
--map('n', '<M->', [[:FloatermNext<CR>]], {})
--map('n', '<M->', [[:FloatermPrev<CR>]], {})

--Telescope keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--Leap keybinds
vim.keymap.set('n', 'F', '<Plug>(leap-backward)', {})

--TODO-Comments keybinds
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
map('n', '<leader>ft', [[:TodoTelescope<CR>]], {})

