return {
  "ms-jpq/coq_nvim",
  branch = "coq",
  event = "VeryLazy",
  -- lazy = false,
  dependencies = {
    {
      "ms-jpq/coq.artifacts",
      branch = "artifacts"
    },
    {
      "ms-jpq/coq.thirdparty",
      branch = "3p",
      config = function()
        require("coq_3p") {
          { src = "nvimlua", short_name = "nLUA", conf_only = true },
          { src = "bc",      short_name = "MATH", precision = 6 },
          { src = "figlet",  short_name = "BIG" },
          { src = "cow",     trigger = "!cow" },
        }
      end
    }
  },

  config = function()
    vim.o.pumblend = 30
    vim.g.coq_settings = {
      keymap = {
        pre_select = true
      }
    }
    require "coq"
  end
}
