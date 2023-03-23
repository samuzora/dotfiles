return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  cmd = "Copilot",
  config = {
    panel = {
      auto_refresh = true,
      keymap = {
        open = "<C-Left>",
      },
      layout = {
        position = "left",
        ratio = 0.4
      }
    },
    suggestion = {
      auto_trigger = true,
      debounce = 20,
      keymap = {
        accept = "<Right>",
        accept_word = "<C-Right>",
        accept_line = "<M-Right>",
        next = "<M-]>",
        prev = "<M-[>",
      }
    }
  }
}
