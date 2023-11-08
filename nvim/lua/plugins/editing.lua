return {
  -- move blocks of text
  {
    "echasnovski/mini.move",
    event = "VeryLazy",
    config = function() require("mini.move").setup() end
  },

  -- live command preview
  {
    "smjonas/live-command.nvim",
    config = function()
      require("live-command").setup {
        commands = {
          Norm = { cmd = "norm" },
          Reg = {
            cmd = "norm",
            -- This will transform ":5Reg a" into ":norm 5@a"
            args = function(opts)
              return (opts.count == -1 and "" or opts.count) .. "@" .. opts.args
            end,
            range = "",
          }
        }
      }
    end
  },

  -- auto template string
  {
    "axelvc/template-string.nvim",
    opts = {}
  },

  -- comments
  {
    "numToStr/Comment.nvim",
    dependencies = {
    },
    event = "VeryLazy",
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
    }
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "vue" },
  },

  -- rename variables
  {
    "smjonas/inc-rename.nvim",
    config = true,
    keys = {
      { "gR", ":IncRename ", desc = "Rename variable" },
    }
  },
}
