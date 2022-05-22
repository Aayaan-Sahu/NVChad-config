local map = require("core.utils").map

local utils = require "core.utils"

local config = utils.load_config()
local map_wrapper = utils.map

local maps = config.mappings
local plugin_maps = maps.plugins
local nvChad_options = config.options.nvChad

-- Some remaps
map("n", "<S-h>", ":bprevious<CR>")
map("n", "<S-l>", ":bnext<CR>")
map("n", "<TAB>", ":tabNext<CR>")
map("n", "<S-Tab>", ":tabprevious<CR>")

map("n", "C-p>", ":Telescope find_files<CR>")

plugin_maps.nvimtree.focus = "<C-n>"
plugin_maps.nvimtree.toggle = "<leader>e"

map("n", plugin_maps.nvimtree.toggle, ":NvimTreeToggle <CR>")
map("n", plugin_maps.nvimtree.focus, ":NvimTreeFocus <CR>")

map("n", plugin_maps.nvimtree.focus, ":NvimTreeToggle <CR>")
map("n", plugin_maps.nvimtree.toggle, ":NvimTreeFocus <CR>")

local m = plugin_maps.lspconfig
map("n", "gl", ":Lspsaga show_line_diagnostics<CR>")
map("n", "gL", ":Lspsaga show_cursor_diagnostics<CR>")
map("n", m.rename, ":Lspsaga rename<CR>")
map("n", m.code_action, ":Lspsaga code_action<CR>")

map("v", "<", "<gv")
map("v", ">", ">gv")

map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")

map("n", "<F1>", ":FloatermToggle<CR>");
