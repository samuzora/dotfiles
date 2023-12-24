return {
  {
    "rmagatti/auto-session",
    event = "VeryLazy",
    init = function()
      vim.o.sessionoptions = "blank,buffers,curdir,folds,tabpages,winsize,winpos,terminal,localoptions"

      local autocmd = vim.api.nvim_create_autocmd

      local lazy_did_show_install_view = false

      local function auto_session_restore()
        -- important! without vim.schedule other necessary plugins might not load (eg treesitter) after restoring the session
        vim.schedule(function()
          require("auto-session").AutoRestoreSession()
        end)
      end

      autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          local lazy_view = require("lazy.view")

          if lazy_view.visible() then
            -- if lazy view is visible do nothing with auto-session
            lazy_did_show_install_view = true
          else
            -- otherwise load (by require'ing) and restore session
            auto_session_restore()
          end
        end,
      })

      autocmd("WinClosed", {
        pattern = "*",
        callback = function(ev)
          local lazy_view = require("lazy.view")

          -- if lazy view is currently visible and was shown at startup
          if lazy_view.visible() and lazy_did_show_install_view then
            -- if the window to be closed is actually the lazy view window
            if ev.match == tostring(lazy_view.view.win) then
              lazy_did_show_install_view = false
              auto_session_restore()
            end
          end
        end,
      })
    end,
    opts = {
      auto_save_enabled = true,
      auto_restore_enabled = true,
      auto_session_allowed_dirs = {
        "/home/samuzora/.config/nvim",
        "/home/samuzora/github/hackac-platform",
        "/home/samuzora/github/ctf-cord",
        "/home/samuzora/github/blog",
      },
      session_lens = {
        load_on_setup = false,
      }
    }
  },
}
