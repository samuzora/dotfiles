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
              { "", "```" },
            }
          end,
        },
      }
    }
  },


  -- autopairing
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      { "$", "$", ft = { "typst", "tex" }, fly = true, space = true, newline = true, dosuround = true },
      config_internal_pairs = {
        { "```", "```", ft = { "markdown", "typst" } },
      },
      fastwarp = {
        enable = true,
        nocursormove = false,
        multiline = true,
        faster = true,
        map = "<M-l>",
        rmap = "<M-h>",
        cmap = "<M-l>",
        rcmap = "<M-h>",
      },
    }
  },
}
