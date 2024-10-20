local map = vim.api.nvim_set_keymap

--Telescope keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fl', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--TODO-Comments keybinds
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
map('n', '<leader>ft', [[:TodoTelescope<CR>]], {})

--LSP keybinds
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = event.buf}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Display documentation of the symbol under the cursor
    bufmap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    bufmap('n', '<leader>lg', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Selects a code action available at the current cursor position
    -- bufmap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    vim.keymap.set({ "v", "n" }, "<leader>la", require("actions-preview").code_actions)
  end
})

--dap keybinds
local dap = require('dap')
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {})
vim.keymap.set('n', '<leader>dc', dap.continue, {})
vim.keymap.set('n', '<F10>', dap.step_into, {})
vim.keymap.set('n', '<F11>', dap.step_over, {})
vim.keymap.set('n', '<F12>', dap.step_out, {})
vim.keymap.set('n', '<leader>dr', dap.run_last, {})
vim.keymap.set('n', '<Leader>dl',
  function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
