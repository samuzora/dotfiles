return {
  {
    "echasnovski/mini.move",
    event = "VeryLazy",
    config = function() require("mini.move").setup() end
  },
  {
    "echasnovski/mini.align",
    event = "VeryLazy",
    config = function()
      require "mini.align".setup {
        mappings = {
          start_with_preview = "<M-a>"
        }
      }
    end
  },
  {
    "numToStr/Comment.nvim",
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "vue" },
      }
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

  -- rename variables
  {
    "smjonas/inc-rename.nvim",
    config = true,
    keys = {
      { "<Leader>rn", "<cmd>IncRename ", desc = "Rename variable" },
    }
  },

  -- search and replace
  {
    "cshuaimin/ssr.nvim",
    config = function()
      require("ssr").setup {
        border = "rounded",
        min_width = 50,
        min_height = 5,
        max_width = 120,
        max_height = 25,
        keymaps = {
          close = "q",
          next_match = "n",
          prev_match = "N",
          replace_confirm = "<cr>",
          replace_all = "<leader><cr>",
        },
      }
    end,
    keys = {
      { "<leader>sr", function() require("ssr").open() end, desc = "Search and replace" }
    }
  }
}
