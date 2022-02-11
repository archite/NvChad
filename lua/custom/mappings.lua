local utils = require("core.utils")

local config = utils.load_config()
local map = utils.map

local maps = config.mappings
local plugin_maps = maps.plugins

map("n", "<Esc>", ":noh <CR> <C-l>")
-- map("n", "<Esc>", "<C-l> :noh <CR>")
-- map("n", "<Esc>", ":mode <CR>")

map("n", maps.misc.close_buffer_win, ":lua require('core.utils').close_buffer() <CR> <C-w>c")
map("n", maps.misc.force_quit_all, ":qall! <CR>")
map("n", maps.misc.quit_all, ":qall <CR>")

map("n", maps.symbols.toggle, ":SymbolsOutline <CR>")

map("n", maps.truezen.ataraxis, ":TZAtaraxis <CR>")
map("n", maps.truezen.focus, ":TZFocus <CR>")
map("n", maps.truezen.minimalist, ":TZMinimalist <CR>")

map("n", plugin_maps.comment.toggle_block, ":lua require('Comment.api').toggle_current_blockwise()<CR>")
map("v", plugin_maps.comment.toggle_block, ":lua require('Comment.api').toggle_blockwise_op(vim.fn.visualmode())<CR>")

map("n", plugin_maps.telescope.keymaps, ":Telescope keymaps <CR>")
