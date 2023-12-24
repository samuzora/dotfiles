return {
  -- formatters
  {
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
  },

  -- move blocks of text
  {
    "echasnovski/mini.move",
    keys = {
      { "<M-h>", mode = { "n", "v" } },
      { "<M-j>", mode = { "n", "v" } },
      { "<M-k>", mode = { "n", "v" } },
      { "<M-l>", mode = { "n", "v" } },
    },
    config = true,
  },

  -- auto template string
  {
    "axelvc/template-string.nvim",
    ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "python" },
    opts = {
      remove_template_string = true,
      restore_quotes = {
        normal = [["]],
        jsx = [["]],
      }
    },
  },

  -- comments
  {
    "numToStr/Comment.nvim",
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "vue" },
      }
    },
    keys = {
      { "<leader>c", mode = { "n", "v" } },
      { "<leader>b", mode = { "n", "v" } },
    },
    opts = {
      toggler = {
        line = "<leader>cc",
        block = "<leader>bb",
      },
      opleader = {
        line = "<leader>c",
        block = "<leader>b",
      },
      extra = {
        above = "<leader>cO",
        below = "<leader>co",
        eol = "<leader>cA",
      }
    },
  },

  -- rename variables
  {
    "smjonas/inc-rename.nvim",
    keys = {
      { "<leader>r", ":IncRename ", desc = "Rename variable" },
    },
    config = true,
  },
}
