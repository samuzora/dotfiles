return {
  -- neorg
  {
    "nvim-neorg/neorg",
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
}
