vim.o.background = dark

vim.cmd [[
try
  set termguicolors
  let ayucolor = "mirage"
  colorscheme ayu
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

require('lualine').setup()
