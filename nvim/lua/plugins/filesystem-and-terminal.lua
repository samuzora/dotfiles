return {
  -- neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
      require("neo-tree").setup()
    end,
    keys = {
      { "<leader>fd", ":Neotree toggle<CR>", desc = "Open filetree" }
    }
  },
  {
    "s1n7ax/nvim-window-picker",
    config = true,
  },

  -- oil.nvim (vim-like filesystem manipulation)
  {
    "stevearc/oil.nvim",
    keys = { { "-", ":Oil<CR>", desc = "Open parent directory in Oil" } },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require("oil").setup({
        view_options = {
          show_hidden = true
        }
      })
    end,
    lazy = false
  },

  -- toggleterm
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        size = vim.o.columns * 0.4,
        open_mapping = "<leader>t",
        insert_mappings = false,
        terminal_mappings = false,
        direction = "vertical",
        winbar = {
          enabled = false,
          name_formatter = function(term)
            return term.name
          end
        }
      })

      -- lazygit integration
      local terminal = require("toggleterm.terminal").Terminal
      local lazygit = terminal:new({ cmd = "lazygit", direction = "float", hidden = true })
      vim.keymap.set('', '<leader>gl', function() lazygit:toggle() end)

      -- remap escape in terminal mode
      vim.keymap.set("t", "<Esc>", [[<c-\><c-n>]])
      vim.keymap.set("t", "<M-[>", "<esc>")
    end,
    keys = {
      { "<leader>t", desc = "Open terminal" }, { "<leader>gl", desc = "Open lazygit" }
    }
  },
  {
    "chomosuke/term-edit.nvim",
    ft = "toggleterm",
    version = "1.*",
    config = {
      prompt_end = "%$ "
    }
  },
}
