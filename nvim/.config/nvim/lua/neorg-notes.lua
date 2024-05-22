require("neorg").setup {
	load = {
		["core.defaults"] = {},
		--["core.concealer"] = {},
		["core.dirman"] = {
			config = {
				workspaces = {
					notes = "~/notes",
				},
				default_workspace = "notes",
			},
		},
		["core.journal"] = {
			config = {
				workspace = "notes",
			},
		},
	},
}
