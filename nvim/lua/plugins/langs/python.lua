return {
  {
    "AckslD/swenv.nvim",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    keys = {
      { "gV", function() require('swenv.api').pick_venv() end, desc = "Pick virtualenv" },
    },
    config = function()
      require("swenv").setup {
        venvs_path = vim.fn.expand("~/.cache/pypoetry/virtualenvs/"),
        post_set_venv = function(venv)
          local scan_dir = require('plenary.scandir').scan_dir
          local paths = scan_dir(venv.path, { depth = 3, only_dirs = true, silent = true })
          vim.fn.setenv('PYTHONPATH', vim.fn.join(paths, ':'))
          vim.cmd.LspRestart()
        end
      }
    end,
  }
}
