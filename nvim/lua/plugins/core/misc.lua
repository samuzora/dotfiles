vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local permission_hlgroups = {
  ['-'] = 'NonText',
  ['r'] = 'Delimiter',
  ['w'] = 'Number',
  ['x'] = 'DiagnosticSignOk',
}

return {
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

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    event = "VeryLazy",
    config = function()
      local ls = require "luasnip"

      require "luasnip".config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
        store_selection_keys = "<Tab>",
      }

      vim.keymap.set({ "i" }, "<C-L>", function() ls.expand() end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-k>", function() ls.jump(-1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })

      require "luasnip.loaders.from_vscode".lazy_load()
      require "luasnip.loaders.from_lua".lazy_load { paths = "~/.config/nvim/lua/plugins/snippets" }
    end
  },

  -- files
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    ft = "oil",
    keys = {
      { "-", function() require("oil").open() end },
    },
    init = function()
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        -- Capture the protocol and lazy load oil if it is "oil-ssh", besides also lazy
        -- loading it when the first argument is a directory.
        local adapter = string.match(vim.fn.argv(0), "^([%l-]*)://")
        if (stat and stat.type == "directory") or adapter == "oil-ssh" then
          require("lazy").load({ plugins = { "oil.nvim" } })
        end
      end
      if not require("lazy.core.config").plugins["oil.nvim"]._.loaded then
        vim.api.nvim_create_autocmd("BufNew", {
          callback = function()
            if vim.fn.isdirectory(vim.fn.expand("<afile>")) == 1 then
              require("lazy").load({ plugins = { "oil.nvim" } })
              -- Once oil is loaded, we can delete this autocmd
              return true
            end
          end,
        })
      end
    end,
    opts = {
      columns = {
        {
          "icon",
          highlight = "Number",
        },
        {
          "size",
          highlight = "Special",
        },
        {
          "permissions",
          highlight = function(permission_str)
            local hls = {}
            for i = 1, #permission_str do
              local char = permission_str:sub(i, i)
              table.insert(hls, { permission_hlgroups[char], i - 1, i })
            end
            return hls
          end,
        }
      },
      win_options = {
        number = false,
        relativenumber = false,
        signcolumn = "yes:1",
        foldcolumn = "0",
        statuscolumn = "",
      },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      default_file_explorer = true,
      view_options = {
        show_hidden = true
      },
      keymaps = {
        ["q"] = "actions.close",
      },
    },
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

  -- select blocks of treesitter nodes
  {
    "SUSTech-data/wildfire.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", },
    keys = {
      { "<CR>", mode = "n" }
    },
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
}
