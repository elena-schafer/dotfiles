require("nvim-treesitter.configs").setup {
  ensure_installed = { "c", "lua", "bash", "java", "json5", "latex", "python", "sql", "vim", "vimdoc", },
  highlight = { enable = true, },
  incremental_selection = { enable = true, },
  indent = { enable = true, },
}
