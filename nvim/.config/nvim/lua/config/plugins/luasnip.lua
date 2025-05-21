return {
	{
		"L3MON4D3/LuaSnip",
		opts = {
			enable_autosnippets = true,
			update_events = 'TextChanged,TextChangedI'
		},
		config = function(_, opts)
			local ls = require("luasnip")
			ls.setup(opts)
			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/config/snippets/" })
		end,
	},
}
