return {
  "CKolkey/ts-node-action",
  dependencies = {
    "nvim-treesitter"
  },
  keys = {
    { "<leader>k", function() require("ts-node-action").node_action() end }
  }
}
