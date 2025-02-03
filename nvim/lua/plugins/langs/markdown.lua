vim.filetype.add({
  extension = {
    mdx = "markdown",
  }
})

return {
  "MeanderingProgrammer/markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  ft = "markdown",
  opts = {
    render_modes = { "n", "c", "i" },
    heading = {
      icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
      width = "block"
    },
    code = {
      position = "left",
      left_pad = 2,
      right_pad = 2,
      width = "block",
    },
    bullet = {
      icons = { "-", "-", "-", "-" }
    }
  },
}
