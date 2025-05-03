return {
	{
		"L3MON4D3/LuaSnip",
		opts = {
			enable_autosnippets = true,
		},
		config = function()
			local ls = require("luasnip")

			-- set tab to expand snippet if it can, else jump if it can, else just insert a tab character
			-- vim.keymap.set({ "i" }, "<Tab>", function()
			-- 	if ls.expandable() then
			-- 		ls.expand()
			-- 	elseif ls.jumpable() then
			-- 		ls.jump(1)
			-- 	else
			-- 		vim.api.nvim_put({ "\t" }, "", false, true)
			-- 	end
			-- end, { silent = true })

			-- vim.keymap.set({ "i", "s" }, "<S-Tab>", function() ls.jump(-1) end, { silent = true })
			--
			-- vim.keymap.set({ "i", "s" }, "<C-E>", function()
			-- 	if ls.choice_active() then
			-- 		ls.change_choice(1)
			-- 	end
			-- end, { silent = true })

			ls.setup({
				update_events = 'TextChanged,TextChangedI'
			})
			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/config/snippets/" })
		end,
	},
}
