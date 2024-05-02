return {
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    opts = {
      preview = {
        win_height = 10,
        win_vheight = 10,
      },
      func_map = {
        stogglebuf = "mm",
        stogglevm = "m",
        stoggleup = "m<S-Tab>",
        stoggledown = "m<Tab>",
        sclear = "dm",

        lastleave = "<C-o>",
        filter = "fm",
        filterr = "fM",
      }
    }
  }
}
