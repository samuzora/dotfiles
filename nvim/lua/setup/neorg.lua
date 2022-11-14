require("neorg").setup({
  load = {
    ["core.defaults"] = {},
    ["core.norg.concealer"] = {},
    ["core.norg.dirman"] = {
      config = {
	workspaces = {
	  todo = "~/neorg/school"
	},
	autochdir = true,
      },
    },
    ["core.norg.qol.toc"] = {},
    ["core.presenter"] = {
      config = {
	zen_mode = "truezen",
      },
    },
  },
})
