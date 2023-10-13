require("bufferline").setup {
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer", 
        text_align = "center",
      }
    },
    separator_style = "slant",
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
  }
}
vim.opt.termguicolors = true
