local customPlugins = require("core.customPlugins")

customPlugins.add(function(use)
  use {
    "williamboman/nvim-lsp-installer",
  }

  use { "rafcamlet/nvim-luapad" }

  use {
    "luukvbaal/stabilize.nvim",
    config = function() require("stabilize").setup() end
  }

  use { "nathom/filetype.nvim" }

  use {
    'simrat39/symbols-outline.nvim',
    config = function()
      require('custom.plugins.symbols')
    end
  }

  use { "martinda/Jenkinsfile-vim-syntax" }

  use {
    "blackCauldron7/surround.nvim",
    config = function()
      require"surround".setup({mappings_style = "sandwich"})
    end
  }

  use {
    'windwp/nvim-projectconfig',
    config = function() require('nvim-projectconfig').setup() end
  }
end)
