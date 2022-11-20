require("treesitter-context").setup({
  enable = true,
  packages = {
    default = {
      'class',
      'function',
      'method',
      'for',
      'while',
      'if',
      'switch',
      'case',
    },
  },
  separator = '-'
})
