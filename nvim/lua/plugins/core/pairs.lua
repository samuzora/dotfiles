return {
  -- surround operations
  {
    "kylechui/nvim-surround",
    keys = { "yp", "yP", "ypp", "yPP", "dp", "cpp", "cp", { "P", mode = "v" }, { "gP", mode = "v" } },
    opts = {
      keymaps = {
        normal = "yp",
        normal_cur = "ypp",
        normal_line = "yP",
        normal_cur_line = "yPP",
        delete = "dp",
        change = "cp",
        change_line = "cpp",
        visual = "P",
        visual_line = "gP"
      },
      surrounds = {
        ["$"] = {
          add = function()
            return { { "$" }, { "$" } }
          end
        },
        ["c"] = {
          add = function()
            local config = require("nvim-surround.config")
            local result = config.get_input("Markdown code block language: ")
            return {
              { "```" .. result, "" },
              { "",              "```" },
            }
          end,
        },
      }
    }
  },

  -- autopairing
  {
    "altermo/ultimate-autopair.nvim",
    enabled = false, -- there's a bug with python f-string and b-string like so: p.sendlineafter(b"test", b") <-- next quote does not autopair
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      { "$", "$", ft = { "typst", "tex" }, fly = true, space = true, newline = true, dosuround = true },
      config_internal_pairs = {
        { "```", "```", ft = { "markdown", "typst" } },
      },
      tabout = {
        enable = true,
        map = "<C-]>",
        cmap = "<C-]>",
        hopout = true,
      },
      fastwarp = {
        enable = true,
        nocursormove = false,
        multiline = true,
        faster = true,
        map = "<C-l>",
        rmap = "<C-h>",
        cmap = "<C-l>",
        rcmap = "<C-h>",
      },
    }
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      fast_wrap = {
        map = "<C-e>"
      }
    },
    config = function(_, opts)
      require"nvim-autopairs".setup(opts)

      -- match padding
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"

      local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
      npairs.add_rules {
        -- Rule for a pair with left-side ' ' and right side ' '
        Rule(' ', ' ')
        -- Pair will only occur if the conditional function returns true
            :with_pair(function(opts)
              -- We are checking if we are inserting a space in (), [], or {}
              local pair = opts.line:sub(opts.col - 1, opts.col)
              return vim.tbl_contains({
                brackets[1][1] .. brackets[1][2],
                brackets[2][1] .. brackets[2][2],
                brackets[3][1] .. brackets[3][2]
              }, pair)
            end)
            :with_move(cond.none())
            :with_cr(cond.none())
        -- We only want to delete the pair of spaces when the cursor is as such: ( | )
            :with_del(function(opts)
              local col = vim.api.nvim_win_get_cursor(0)[2]
              local context = opts.line:sub(col - 1, col + 2)
              return vim.tbl_contains({
                brackets[1][1] .. '  ' .. brackets[1][2],
                brackets[2][1] .. '  ' .. brackets[2][2],
                brackets[3][1] .. '  ' .. brackets[3][2]
              }, context)
            end)
      }
      -- For each pair of brackets we will add another rule
      for _, bracket in pairs(brackets) do
        npairs.add_rules {
          -- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
          Rule(bracket[1] .. ' ', ' ' .. bracket[2])
              :with_pair(cond.none())
              :with_move(function(opts) return opts.char == bracket[2] end)
              :with_del(cond.none())
              :use_key(bracket[2])
          -- Removes the trailing whitespace that can occur without this
              :replace_map_cr(function(_) return "<C-c>2xi<CR><C-c>O" end)
        }
      end
    end
  }
}
