return {
  "williamboman/mason-lspconfig.nvim",
  "hrsh7th/cmp-nvim-lsp",

  {
    "toppair/peek.nvim",
    config = true,
    run = "deno task --quiet build:fast",
    keys = {
      { "<leader>mdo", function() require('peek').open() end },
      { "<leader>mdc", function() require('peek').close() end }
    }
  },

  {
    "folke/which-key.nvim",
    config = {
      plugins = {
        spelling = {
          enabled = true,
        }
      }
    }
  },

  {
    "stevearc/oil.nvim",
    config = true
  },

  {
    "elkowar/yuck.vim"
  },

  {
    "chomosuke/term-edit.nvim",
    ft = "toggleterm",
    version = "1.*",
    config = {
      prompt_end = "%$ "
    }
  },

  {
    "stevearc/overseer.nvim",
    config = {
      templates = { "builtin", "cpp_build" }
    },
    keys = {
      { "<leader>g++", ":OverseerRun<CR>1<CR>" }
    }
  },

  {
    "windwp/nvim-autopairs",
    config = true
  },

  "tpope/vim-repeat",
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", ":UndotreeToggle" }
    }
  },

  {
    "s1n7ax/nvim-window-picker",
    config = true,
  },
  {
    "lambdalisue/suda.vim",
  },
  {
    "chentoast/marks.nvim",
    config = true,
  },
  {
    "Eandrju/cellular-automaton.nvim",
    keys = {
      { "<leader>fun", ":CellularAutomaton make_it_rain<CR>" }
    },
  },
  {
    "f-person/git-blame.nvim",
    config = function()
      vim.g.gitblame_enabled = 0
      vim.g.gitblame_message_template = ' <author> • <summary> • <date>'
      vim.g.gitblame_date_format = '%r'
    end,
    keys = {
      { "<leader>gb", ":GitBlameToggle<CR>" }
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "lervag/vimtex",
    ft = { 'tex' },
  },
  {
    "smjonas/inc-rename.nvim",
    config = true,
    keys = {
      { "<leader>rn", ":IncRename " }
    }
  },
  {
    "ziontee113/color-picker.nvim",
    ft = {
      "html",
      "css",
      "javascriptreact",
      "scss",
      "sass",
      "conf",
    },
    config = {
      border = "rounded",
      icons = { "-", ">" },
      keymap = {
        b = "<Plug>ColorPickerSlider10Decrease",
      }
    },
    keys = {
      { "<leader>c", ":PickColor<CR>" }
    }
  }
}
