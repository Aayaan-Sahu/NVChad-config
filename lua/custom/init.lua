-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!
-- This is an example init file in /lua/custom/
-- this init.lua can load stuffs etc too so treat it like your ~/.config/nvim/

-- MAPPINGS
local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<C-p>", ":Telescope find_files<CR>")
map("n", "<leader>q", ":q <CR>")

require("custom.mappings")
require("custom.lspsaga")
require("custom.symbols_outline")

vim.cmd [[
  imap <silent><script><expr> <C-G> copilot#Accept("\<CR>")
  let g:copilot_no_tab_map = v:true
]]

-- disable comments
vim.cmd [[
  autocmd BufNewFile,BufRead * set formatoptions-=c formatoptions-=r formatoptions-=o
]]

vim.cmd [[
  autocmd FileType python setl tabstop=4|setl shiftwidth=4|setl softtabstop=4
  autocmd FileType html setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
  autocmd FileType javascript setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
  autocmd FileType css setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
  autocmd FileType c++ setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
]]

-- set guifont=JetBrainsMono\ Nerd\ Font:h15
vim.cmd [[
  set autoread
  au CursorHold * checktime
  set guifont=FiraCode\ Nerd\ Font:h15
]]

-- NOTE: the 4th argument in the map function is be a table i.e options but its most likely un-needed so dont worry about it
