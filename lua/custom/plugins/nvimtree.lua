local present, nvimtree = pcall(require, "nvim-tree")

local conf = require("core.utils").load_config().plugins.options.nvimtree

local git_status = conf.enable_git
local ui = conf.ui

if not present then
  return
end

local g = vim.g

g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
g.nvim_tree_git_hl = git_status
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_indent_markers = 1
g.nvim_tree_quit_on_open = 0 -- closes tree when file's opened
g.nvim_tree_respect_buf_cwd = 1
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

g.nvim_tree_window_picker_exclude = {
  buftype = { "terminal" },
  filetype = { "Outline", "notify", "packer", "qf" }
}

g.nvim_tree_show_icons = {
  files = 1,
  folders = 1,
  git = git_status
}

g.nvim_tree_icons = {
  default = "",
  folder = {
    default = "",
    empty = "",
    empty_open = "",
    open = "",
    symlink = "",
    symlink_open = "",
  },
  git = {
    deleted = "",
    ignored = "◌",
    renamed = "➜",
    staged = "✓",
    unmerged = "",
    unstaged = "✗",
    untracked = "★",
  },
  symlink = ""
}

nvimtree.setup {
  auto_close = false,
  disable_netrw = true,
  filters = {
    dotfiles = true
  },
  git = {
    ignore = false
  },
  hijack_cursor = true,
  hijack_netrw = true,
  ignore_ft_on_setup = {
    "dashboard"
  },
  open_on_tab = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  update_to_buf_dir = {
    enable = true,
    auto_open = true
  },
  view = ui
}

local winopts = require('nvim-tree.view').View.winopts
winopts.signcolumn = 'no'
winopts.number = true
winopts.relativenumber = true
