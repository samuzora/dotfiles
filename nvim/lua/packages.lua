local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd [[packadd packer.nvim]]
end

function setup(name)
  require(string.format("setup.%s", name))
end

require('packer').startup({
  function(use)
    use 'wbthomason/packer.nvim' -- auto update packer.nvim
    use { 'lewis6991/impatient.nvim', config = [[setup("impatient")]] }

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', config = [[setup("treesitter")]], run = ":TSUpdate" } -- commit = '4cccb6' }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use { 'nvim-treesitter/nvim-treesitter-context', config = [[setup("treesitter-context")]] }

    -- lsp, completion and linting
    use { 'neovim/nvim-lspconfig', config = [[setup("lspconfig")]] }
    use 'lukas-reineke/lsp-format.nvim'
    use { 'williamboman/mason.nvim', config = [[setup("mason")]], requires = { "williamboman/mason-lspconfig.nvim" } }
    use {
      'hrsh7th/nvim-cmp',
      config = [[setup('nvim-cmp')]],
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline'
      }
    }
    use { 'windwp/nvim-autopairs', config = [[setup("nvim-autopairs")]] }
    use { 'windwp/nvim-ts-autotag', config = [[setup("nvim-ts-autotag")]] }

    use { 'folke/trouble.nvim', config = [[setup("trouble")]] }

    -- ui
    use { 'rose-pine/neovim', config = [[setup("rose-pine")]] }
    use { 'nvim-lualine/lualine.nvim', config = [[setup("lualine")]] }
    use { 'folke/noice.nvim',
      event = 'VimEnter',
      config = [[setup("noice")]],
      requires = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      },
    }
    use 'kyazdani42/nvim-web-devicons'
    use { 'anuvyklack/pretty-fold.nvim', config = [[setup("pretty-fold")]] }
    use { 'p00f/nvim-ts-rainbow' }
    use { "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" }

    -- super fast navigation
    use { 'ggandor/leap.nvim', config = [[setup('leap')]] }
    use { 'ggandor/leap-spooky.nvim', config = [[setup('leap-spooky')]] }
    use { 'stevearc/aerial.nvim', config = [[setup('aerial')]] }

    -- documentation
    use { 'kkoomen/vim-doge', config = [[setup("vim-doge")]], run = ":call doge#install()" }

    -- editing
    use { 'kylechui/nvim-surround', config = [[setup("nvim-surround")]] }
    use { 'lambdalisue/suda.vim', config = [[setup("suda")]] }
    use { 'Pocco81/true-zen.nvim', config = [[setup("true-zen")]] }

    use {
      'ziontee113/color-picker.nvim',
      ft = { 'html', 'css', 'javascriptreact', 'scss', 'sass', 'conf' },
      config = [[setup("color-picker")]],
    }
    use { 'chentoast/marks.nvim', config = [[setup("marks")]] }
    use 'tpope/vim-repeat'
    use { 'smjonas/inc-rename.nvim', config = [[setup("inc-rename")]] }
    use 'mbbill/undotree'

    -- file browser
    use { 'nvim-neo-tree/neo-tree.nvim', config = [[setup("neo-tree")]],
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      }
    }

    -- autocomplete
    -- formatting
    use { 'sbdchd/neoformat' }
    use { 'AckslD/nvim-trevJ.lua', config = [[setup("nvim-trevJ")]] }

    -- git
    use { 'f-person/git-blame.nvim', config = [[setup("git-blame")]] }
    use { 'lewis6991/gitsigns.nvim', config = [[setup("gitsigns")]] }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- terminal
    use { 'akinsho/toggleterm.nvim', config = [[setup("toggleterm")]] }

    -- mini.nvim
    use { 'echasnovski/mini.nvim', config = [[setup("mini")]] }

    -- notes
    -- use { 'ellisonleao/glow.nvim', ft = { 'markdown' }, config = [[setup("glow")]] }
    use { 'jbyuki/nabla.nvim' }
    use {
      'iamcco/markdown-preview.nvim',
      run = "cd app && npm install",
      setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
      ft = { "markdown" }
    }
    use { 'lervag/vimtex', ft = { 'tex' } }
    use {
      'nvim-neorg/neorg',
      tag = "*",
      config = [[setup("neorg")]],
      after = "nvim-treesitter",
      requires = { "nvim-lua/plenary.nvim", "max397574/neorg-contexts" },
    }

    -- telescope
    use {
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      requires = { 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } },
      config = [[setup("telescope")]]
    }

    -- random
    -- use { 'samuzora/pet.nvim', config = [[setup("pet-nvim")]] }
    -- use { '~/pet.nvim', config = [[setup("pet-nvim")]] }
    use { 'Eandrju/cellular-automaton.nvim' }
    --
    -- keybinds
    -- use { 'mrjones2014/legendary.nvim', config = [[setup("legendary")]] }

    -- bootstrap
    if packer_bootstrap then
      require('packer').sync()
    end

  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end
    },
  },
})
