vim.g.mapleader = " "
local keymap = vim.keymap

--mode changing keymaps
keymap.set("i", "jk","<ESC>",{desc = "exit insert mode"})

--searching keymaps
keymap.set("n","<leader>cs",":nohl<CR>", {desc = "clear word search"})

--moving keymaps
--insert mode
--keymap.set("i","<C-h>","<LEFT>", {desc = "alt h in insert mode to move left"})
--keymap.set("i","<C-l>","<RIGHT>", {desc = "alt l in insert mode to move right"})
--keymap.set("i","<C-k>","<UP>", {desc = "alt k in insert mode to move up"})
--keymap.set("i","<C-j>","<DOWN>", {desc = "alt j in isert mode to move down"})

--normal mode
keymap.set("n","<S-h>","<S-LEFT>", {desc = "shift + h = previous word"})
keymap.set("n","<S-l>","<S-RIGHT>", {desc = "shift + l = next word"})



--splitting windows
keymap.set("n","<leader>sv","<C-w>s", {desc = "split vertically"})
keymap.set("n","<leader>sh","<C-w>v", {desc = "split horizontally"})
keymap.set("n","<leader>se","<C-w>=", {desc = "makes current splits equal size"})
keymap.set("n","<leader>sx","<cmd>close<CR>", {desc = "close current split"})

--change what split is being controlled
keymap.set("n","<C-h>","<C-w>h", {desc = "go to left split"})
keymap.set("n","<C-l>","<C-w>l", {desc = "go to right split"})
keymap.set("n","<C-k>","<C-w>k", {desc = "go to upper split"})
keymap.set("n","<C-j>","<C-w>j", {desc = "go to lower split"})

--change size of current split
keymap.set("n","<A-j>","<C-w>+", {desc = "increase height of current split"})
keymap.set("n","<A-k>","<C-w>-", {desc = "decrease height of current split"})
keymap.set("n","<A-l>","<C-w>>", {desc = "increase width of current split"})
keymap.set("n","<A-h>","<C-w><", {desc = "decrease width of current split"})

--terminal bindings
keymap.set("n", "<leader>tt", "<cmd>split<CR><cmd>term<CR>i", {desc = "open terminal in vertical split"})

keymap.set('t', '<ESC>', [[<C-\><C-n>]], {desc = "normal mode in termianl"})
keymap.set('t', 'jk', [[<C-\><C-n>]], {desc = "normal mode in termianl"})
keymap.set("t","<C-h>","<LEFT>", {desc = "ctrl h in terminal mode to move left"})
keymap.set("t","<C-l>","<RIGHT>", {desc = "ctrl h in terminal mode to move right"})
keymap.set("t","<C-k>","<UP>", {desc = "ctrl h in terminal mode to move up"})
keymap.set("t","<C-j>","<DOWN>", {desc = "ctrl h in terminal mode to move down"})

--browser
keymap.set("n","<leader>bb", "<cmd>Ex<CR>")

--tab keymaps
keymap.set("n","<leader>to","<cmd>tabnew<CR>", {desc = "open new tab"})
keymap.set("n","<leader>tx","<cmd>tabclose<CR>", {desc = "close current tab"})
keymap.set("n","<leader>tn","<cmd>tabn<CR>", {desc = "next tab"})
keymap.set("n","<leader>tp","<cmd>tabp<CR>", {desc = "prev tab"})
keymap.set("n","<leader>tc","<cmd>tabnew %<CR>", {desc = "open current file in new tab"})


--delete word
keymap.set("n","<leader>dd","diw",{desc = "delete word under cursor (here)"})

--select word
keymap.set("n","<leader>vv","viw")
