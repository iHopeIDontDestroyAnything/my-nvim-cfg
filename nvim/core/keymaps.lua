vim.g.mapleader = " "

local keymap = vim.keymap

--mode changing keymaps
keymap.set("i", "jk","<ESC>",{desc = "exit insert mode"})

--searching keymaps
keymap.set("n","<leader>cs",":nohl<CR>", {desc = "clear word search"})

--moving keymaps
--insert mode
keymap.set("i","<C-h>","<LEFT>", {desc = "alt h in insert mode to move left"})
keymap.set("i","<C-l>","<RIGHT>", {desc = "alt l in insert mode to move right"})
keymap.set("i","<C-k>","<UP>", {desc = "alt k in insert mode to move up"})
keymap.set("i","<C-j>","<DOWN>", {desc = "alt j in isert mode to move down"})

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
keymap.set('t', '<ESC>', [[<C-\><C-n>]], {desc = "normal mode in termianl"})
keymap.set('t', 'jk', [[<C-\><C-n>]], {desc = "normal mode in termianl"})
keymap.set("t","<C-h>","<LEFT>", {desc = "ctrl h in terminal mode to move left"})
keymap.set("t","<C-l>","<RIGHT>", {desc = "ctrl h in terminal mode to move right"})
keymap.set("t","<C-k>","<UP>", {desc = "ctrl h in terminal mode to move up"})
keymap.set("t","<C-j>","<DOWN>", {desc = "ctrl h in terminal mode to move down"})

--browser keymaps (nvim-tree)
keymap.set("n","<leader>bb","<cmd>NvimTreeToggle<CR>", {desc = "Toggle browser"})
keymap.set("n","<leader>bc","<cmd>NvimTreeCollapse<CR>", {desc = "Collapse browser"})
keymap.set("n","<leader>br","<cmd>NvimTreeRefresh<CR>", {desc = "Refresh browser"})
keymap.set("n","<leader>bh","<cmd>NvimTreeFindFileToggle<CR>", {desc = "Toggle browser here (on current file)"})

--tab keymaps
keymap.set("n","<leader>to","<cmd>tabnew<CR>", {desc = "open new tab"})
keymap.set("n","<leader>tx","<cmd>tabclose<CR>", {desc = "close current tab"})
keymap.set("n","<leader>tn","<cmd>tabn<CR>", {desc = "next tab"})
keymap.set("n","<leader>tp","<cmd>tabp<CR>", {desc = "prev tab"})
keymap.set("n","<leader>tc","<cmd>tabnew %<CR>", {desc = "open current file in new tab"})

--telescope keymaps (find)
keymap.set("n","<leader>ff","<cmd>Telescope find_files<CR>", {desc = "find files"})
keymap.set("n","<leader>fc","<cmd>Telescope grep_string<CR>", {desc = "find string under cursor"})
keymap.set("n","<leader>fs","<cmd>Telescope live_grep<CR>", {desc = "find string in current directory"})
keymap.set("n","<leader>fr","<cmd>Telescope oldfiles<CR>", {desc = "find recent files"})

--for faster and easier autocomplete 
keymap.set("i","<C-j>","<C-n>",{desc = "autocomplete with ctrl j "})
keymap.set("i","<C-k>","<C-p>",{desc = "autocomplete with ctrl k "})
keymap.set("i","<C-c>","<C-y>",{desc = "confirm autocomplete with ctrl e "})

--indentation
keymap.set("n","<leader>il",">>",{desc = "indent right"})
keymap.set("n","<leader>ih","<<",{desc = "indent left"})

--delete word
keymap.set("n","<leader>dh","diw",{desc = "delete word under cursor (here)"})

