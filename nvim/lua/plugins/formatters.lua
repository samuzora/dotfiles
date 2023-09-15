return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        typst = { "typstfmt" },
      },
      formatters = {
        typstfmt = {
          command = "typstfmt",
          cwd = require("conform.util").root_file({ "typstfmt-config.toml" })
        },
      }
    })
  end,
  keys = {
    {
      "==",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = { "n", "v" },
      desc = "Format file",
    },
  },
}
