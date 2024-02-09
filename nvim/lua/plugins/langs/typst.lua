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
