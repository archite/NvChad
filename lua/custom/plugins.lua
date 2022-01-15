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
    "Pocco81/TrueZen.nvim",
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZFocus",
    },
    config = function()
      require('custom.plugins.truezen')
    end
  }

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
end)
