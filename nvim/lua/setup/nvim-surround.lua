require("nvim-surround").setup({
  surrounds = { 
    ["l"] = {
      add = function()
        return { { "", "" }, { "", "" } }
      end
    },
    ["c"] = {
      add = function()
        return { { "", "```", "" }, { "", "```", "" } }
      end
    },
  }
})
