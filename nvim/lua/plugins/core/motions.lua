return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    "https://codeberg.org/andyg/leap.nvim",
    enabled = false,
    event = "VeryLazy",
    init = function()
      -- Hide the (real) cursor when leaping...
      vim.api.nvim_create_autocmd("User", {
        pattern = "LeapEnter",
        callback = function()
          vim.cmd.hi("Cursor", "blend=100")
          vim.opt.guicursor:append { "a:Cursor/lCursor" }
        end,
      })

      -- ...and restore it afterwards.
      vim.api.nvim_create_autocmd("User", {
        pattern = "LeapLeave",
        callback = function()
          vim.cmd.hi("Cursor", "blend=0")
          vim.opt.guicursor:remove { "a:Cursor/lCursor" }
        end,
      })
    end,
    config = function()
      -- mappings
      vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward)')
      vim.keymap.set({'n', 'x', 'o'}, 'S', '<Plug>(leap-backward)')

      -- jump to target, do something, and then jump back
      vim.keymap.set({ "n", "o" }, "gs", function()
        require("leap.remote").action()
      end)

      require "leap".setup {
        substitute_chars = { ["\r"] = "¬" },
        equivalence_classes = {
          " \t\r\n",
          "~`",
          "1!",
          "2@",
          "3#",
          "4$",
          "5%",
          "6^",
          "7&",
          "8*",
          "9(",
          "0)",
          "-_",
          "=+",
          "[{",
          "]}",
          "\\|",
          ";:",
          "'\"",
          ",<",
          ".>",
          "/?",
        },
        special_keys = {
          next_target = "",
          prev_target = "",
          next_group = "<space>",
          prev_group = "<tab>",
        }
      }
    end,
  },

  -- {
    --   "ggandor/spooky.nvim",
    --   enabled = false,
    --   event = "VeryLazy",
    --   dependencies = "ggandor/leap.nvim",
    --   init = function()
      --     vim.api.nvim_create_augroup("SpookyUser", {})
      --     -- autocmd is fired at the end of the spooky action
      --     vim.api.nvim_create_autocmd("User", {
        --       pattern = "SpookyOperationDone",
        --       group = "SpookyUser",
        --       callback = function(event)
          --         local op = vim.v.operator
          --         -- Restore cursor position
          --         event.data.restore_cursor()
          --       end
          --     })
          --   end,
          --   config = function()
            --     local spooky = require "spooky"
            --     spooky.setup()
            --
            --     local leap_anywhere = function()
              --       require "leap".leap {
                --         opts = { safe_labels = {} }, -- disable autojump
                --         target_windows = vim.tbl_filter(
                  --           function(win) return vim.api.nvim_win_get_config(win).focusable end,
                  --           vim.api.nvim_tabpage_list_wins(0)
                  --         ),
                  --       }
                  --     end
                  --
                  --     -- remote range
                  --     spooky.create_text_object("arr", leap_anywhere, spooky.selectors.range)
                  --
                  --     -- remote line range
                  --     spooky.create_text_object("arR", leap_anywhere, function(state)
                    --       spooky.selectors.range(state)
                    --       vim.cmd [[normal! V]]
                    --     end, { restore_cursor = true })
                    --
                    --     spooky.create_text_object('aa', leap_anywhere, spooky.selectors.lines)
                    --
                    --
                    --     -- remote line
                    --     spooky.create_text_object('ii', leap_anywhere, function()
                      --       local mode = vim.fn.mode(true)
                      --       -- Exit Visual mode if already in it.
                      --       if not mode:match('o') then vim.cmd('normal! ' .. mode:sub(1, 1)) end
                      --       vim.cmd('normal! _vg_')
                      --     end)
                      --   end
                      -- }
                    }
