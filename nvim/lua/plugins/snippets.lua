return {
  "L3MON4D3/LuaSnip",
  config = function()
    require("luasnip").config.set_config({
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
    })

    require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/plugins/snippets"})

    vim.cmd [[
      " Use Tab to expand and jump through nodes
      imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'

      " Use Shift-Tab to jump backwards through nodes
      imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
    ]]
  end
}
