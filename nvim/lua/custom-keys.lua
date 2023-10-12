local map = vim.api.nvim_set_keymap

-- Nvim-Tree keybinds
map('n', '<C-n>', [[:NvimTreeToggle<CR>]], {})

--BufferLine keybinds
map('n', '[b', [[:BufferLineCyclePrev<CR>]], {})
map('n', ']b', [[:BufferLineCycleNext<CR>]], {})

--floaterm keybinds
map('n', '<leader>ft', [[:FloatermNew<CR>]], {})
map('n', '<leader>t', [[:FloatermToggle<CR>]], {})
--map('n', '<M->', [[:FloatermNext<CR>]], {})
--map('n', '<M->', [[:FloatermPrev<CR>]], {})
