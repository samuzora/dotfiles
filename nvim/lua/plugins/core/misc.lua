return {
  -- tmux integration
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  -- registers
  {
    "tversteeg/registers.nvim",
    keys = {
      { "\"",    mode = { "n", "v" } },
      { "<C-R>", mode = "i" }
    },
    cmd = "Registers",
    opts = {
      show = "\"-/_=#%.0123456789abcdefghijklmnopqrstuvwxyz:",
      system_clipboard = false,
      window = {
        max_width = math.floor(vim.o.columns * 0.9),
        transparency = 0,
        border = "rounded",
      },
      sign_highlights = {
        named = "Text",
      }
    }
  },

  -- marks
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = true,
  },

  -- buffers
  {
    "j-morano/buffer_manager.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ls", function() require("buffer_manager.ui").toggle_quick_menu() end, desc = "List buffers" }
    },
    config = true,
  },

  -- run code selection
  {
    "michaelb/sniprun",
    build = "sh ./install.sh",
    cmd = "SnipRun",
    config = true,
  },

  -- sudo write
  {
    "lambdalisue/suda.vim",
    keys = {
      { "<leader>w", vim.cmd.SudaWrite, desc = "Sudo write" }
    },
    config = function()
      vim.g["suda_smart_edit"] = 1
    end,
  },

  -- neorg
  -- {
  --   "vhyrro/luarocks.nvim",
  --   priority = 1000,
  --   config = true,
  -- },
  {
    "nvim-neorg/neorg",
    -- dependencies = { "luarocks.nvim" },
    -- lazy = false,
    version = "v7.0.0",
    ft = "norg",
    config = function()
      require "neorg".setup {
        load = {
          ["core.integrations.treesitter"] = {},
          ["core.concealer"] = {},
          ["core.qol.toc"] = {},
        },
      }
    end,
  },

  -- ascii drawing
  {
    "jbyuki/venn.nvim",
    cmd = "VBox",
  },
}
