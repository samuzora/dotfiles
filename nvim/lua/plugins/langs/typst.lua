vim.keymap.set("n", "<leader>t", function()
end)

return {
  {
    "akinsho/toggleterm.nvim",
    optional = true,
    keys = {
      { "<leader>w", desc = "Start Typst watch", ft = "typst" },
    },
    config = function(_, opts)
      require"toggleterm".setup(opts)

      local Terminal = require("toggleterm.terminal").Terminal
      local main_file = ""
      local typst = Terminal:new({
        display_name = "typst watch"
      })

      -- cmd = "typst watch " .. vim.api.nvim_buf_get_name(0),

      -- typst keymap
      vim.keymap.set("n", "<leader>w",
        function()
          if string.find(vim.api.nvim_buf_get_name(0), "typst watch") then
            typst:toggle()
            return
          end

          if main_file == "" or main_file ~= vim.api.nvim_buf_get_name(0) then
            vim.cmd[[LspStart]]
            vim.cmd[[TypstPin]]
            main_file = vim.api.nvim_buf_get_name(0)
            vim.notify("Watching " .. main_file)

            typst:shutdown()

            typst.cmd = "typst watch " .. main_file .. " --open SumatraPDF.exe"
            typst:open()
          else
            typst:toggle()
          end
        end
      )
    end
  },
  {
    "kaarmu/typst.vim",
    enabled = false,
    ft = "typst",
    init = function()
      vim.g.typst_pdf_viewer = "SumatraPDF.exe"
      vim.g.typst_conceal = 1
    end,
  }
}
