return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup()
		end
	},
}
--dap keybinds
-- local dap = require('dap')
-- vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {})
-- vim.keymap.set('n', '<leader>dc', dap.continue, {})
-- vim.keymap.set('n', '<F10>', dap.step_into, {})
-- vim.keymap.set('n', '<F11>', dap.step_over, {})
-- vim.keymap.set('n', '<F12>', dap.step_out, {})
-- vim.keymap.set('n', '<leader>dr', dap.run_last, {})
-- vim.keymap.set('n', '<Leader>dl',
--   function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
