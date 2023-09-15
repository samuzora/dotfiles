return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    opts = {
      filetypes = {
        javascript = true,
        typescript = true,
        javascriptreact = true,
        typescriptreact = true,
        lua = true,
        python = true,
        rust = true,
        go = true,
        c = true,
        cpp = true,
        java = true,
        typst = true,
        markdown = true,
        sh = true,
        txt = true,
      },
      panel = {
        auto_refresh = true,
        keymap = {
          open = "<C-r>",
        },
        layout = {
          position = "bottom",
          ratio = 0.3
        }
      },
      suggestion = {
        auto_trigger = true,
        debounce = 20,
        keymap = {
          accept = "<Right>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
        }
      },
      server_opts_overrides = {
        settings = {
          advanced = {
            listCount = 10,
            inlineSuggestCount = 10,
          }
        },
      }
    },
  },
}
