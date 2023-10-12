local map = vim.api.nvim_set_keymap

-- Nvim-Tree keybinds
map('n', '<C-n>', [[:NvimTreeToggle<CR>]], {})

--BufferLine keybinds
map('n', '[b', [[:BufferLineCyclePrev<CR>]], {})
map('n', ']b', [[:BufferLineCycleNext<CR>]], {})

--floaterm keybinds
map('n', '<F5>', [[:FloatermNew<CR>]], {})
map('n', '<F6>', [[:FloatermToggle<CR>]], {})
map('n', '<F7>', [[:FloatermNext<CR>]], {})
map('n', '<F8>', [[:FloatermPrev<CR>]], {})
