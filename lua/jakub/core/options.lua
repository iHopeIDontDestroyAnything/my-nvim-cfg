--nvim file explorer tree display
--vim.cmd("let g:netrw_liststyle = 3")
vim.cmd("set noea") --disables changing window size when closing and opening new windows
vim.cmd("set complete+=i")
vim.cmd("set scrolloff+=10")
vim.cmd("set sidescrolloff+=10")

local opt = vim.opt


--shows line numbers
opt.relativenumber = true
opt.number = true 


--tab and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

--wordsearch
opt.ignorecase = true --ignores case when searching
opt.smartcase = true  --if you search with mixed chars it changes to case sensitive 


opt.cursorline = true

--colorscheme settings
opt.termguicolors = true--color text
opt.background = "dark" --dark color scheme 
opt.signcolumn = "yes"  
--vim.cmd "colorscheme tokyonight"
--use system clipboard as default
-- opt.clipboard:append("unnamedplus")
--on arch linux need xclip installed for this to work

--splitting windows
opt.splitright = true; --horizontaly to the right
opt.splitbelow = true; --vertically below






