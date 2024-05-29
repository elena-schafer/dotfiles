local mocha = require("catppuccin.palettes").get_palette "mocha"
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    integrations = {
	mason = true,
	
    },
    highlights = require("catppuccin.groups.integrations.bufferline").get {
        styles = { "italic", "bold" },
        custom = {
            all = {
                fill = { bg = "#000000" },
            },
            mocha = {
                background = { fg = mocha.text },
            },
            latte = {
                background = { fg = "#000000" },
            },
        },
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
vim.cmd.TransparentEnable()
