return {
  "stevearc/conform.nvim",
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
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        typst = { "prettypst" },
        python = { "ruff_format" },
        yaml = { "yamlfmt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        xml = { "xmllint" },
      },
      formatters = {
        typstfmt = {
          command = "typstfmt",
          cwd = require("conform.util").root_file({ "typstfmt-config.toml" })
        },
        prettypst = {
          command = "prettypst",
          args = { "--use-std-in", "--use-std-out", "--file-location=~/.config/prettypst" },
        }
      }
    })
  end,
}
