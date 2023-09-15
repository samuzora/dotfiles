return {
  "L3MON4D3/LuaSnip",
  event = "VeryLazy",
  build = "make install_jsregexp",
  config = function()
    local ls = require "luasnip"

    require "luasnip".config.set_config {
      history = true,
      updateevents = "TextChanged,TextChangedI",
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
    }

    vim.keymap.set({ "i" }, "<C-L>", function() ls.expand() end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(1) end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-k>", function() ls.jump(-1) end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })

    require "luasnip.loaders.from_vscode".lazy_load()
    require "luasnip.loaders.from_lua".lazy_load { paths = "~/.config/nvim/lua/plugins/snippets" }
  end
}
