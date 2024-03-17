vim.keymap.set("n", "<leader>t", function()
  vim.cmd[[LspStart]]
  vim.cmd[[TypstPin]]
  vim.cmd[[TypstWatch]]
end)

return {
  {
    "kaarmu/typst.vim",
    ft = "typst",
    init = function()
      vim.g.typst_pdf_viewer = "SumatraPDF.exe"
      vim.g.typst_conceal = 1
    end
  }
}
