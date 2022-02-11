local M = {}

M.mappings = {
  misc = {
    close_buffer = "<leader>dc",
    close_buffer_win = "<leader>dw",
    copy_whole_file = "<leader>a",
    quit_all = ",q",
    force_quit_all = ",,q"
  },
  symbols = {
    toggle = "<leader>s"
  },
  truezen = {
    ataraxis = "<leader>zz",
    focus = "<leader>zf",
    minimalist = "<leader>zm"
  }
}

M.mappings.plugins = {
  comment = {
    toggle_block = "<leader>?"
  },
  telescope = {
    keymaps = "<leader>tk"
  }
}

M.options = {
  relativenumber = true,
  tabstop = 2,
  undofile = false
}

M.plugins = {
  default_plugin_config_replace = {
    nvim_autopairs = "custom.plugins.autopairs",
    nvim_tree = "custom.plugins.nvimtree"
    -- telescope = "custom.plugins.telescope",
  },
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
    nvimtree = {
      lazy_load = false,
      ui = {
        auto_resize = true,
        width = 30,
      },
    },
    statusline = {
      hidden = {
        "Outline",
      },
      style = "arrow",
    },
    symbols = {
      auto_close = true,
      auto_preview = false,
      relative_width = false,
      show_numbers = true,
      show_relative_numbers = true,
      width = 35,
    },
  },
}

M.ui = {
   theme = "penokai",
}

return M
