vim.filetype.add({
  extension = {
    mdx = "markdown",
  }
})

return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    render_modes = { "n", "c", "i" },
    heading = {
      icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
      width = "block"
    },
    code = {
      position = "left",
      left_pad = 0,
      right_pad = 2,
      min_width = 50,
      width = "block",
      border = "thin",
    },
    bullet = {
      icons = { "-", "-", "-", "-" }
    }
  },
}
