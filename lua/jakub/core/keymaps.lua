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

local function align_token(text, token)
    local lines = {}
    local maxpos = 0

    for line in text:gmatch("[^\n]+") do
        local pos = line:find(token, 1, true)
        if pos then
            maxpos = math.max(maxpos, pos)
        end
        lines[#lines+1] = { line = line, pos = pos }
    end

    local out = {}
    for _, l in ipairs(lines) do
        if l.pos then
            local pad = string.rep(" ", maxpos - l.pos)
            out[#out+1] = l.line:gsub(token, pad .. token, 1)
        else
            out[#out+1] = l.line
        end
    end

    return table.concat(out, "\n")
    -- return out
end

local _should_swap = function(s_pos, e_pos)
    if s_pos[2] > e_pos[2] then
        return true
    end
    if s_pos[2] == e_pos[2] and s_pos[3] > e_pos[3] then
        return true
    end
    return false
end

-- local function get_visual_line_selection()
--     local s_pos      = vim.fn.getpos("v")
--     local e_pos      = vim.fn.getpos(".")
--     if _should_swap(s_pos, e_pos) then
--         s_pos, e_pos = e_pos, s_pos
--     end
--
--     local last_line = vim.api.nvim_buf_get_lines(s_pos[1], e_pos[2] - 1, e_pos[2], false)[1]
--
--     local last_col = #last_line
--
--     return vim.api.nvim_buf_get_text(
--                     s_pos[1],
--                     s_pos[2] - 1,
--                     0,
--                     e_pos[2] - 1,
--                     last_col, {})
-- end
--

local function aling_token_in_selection()
    local s_pos      = vim.fn.getpos("v")
    local e_pos      = vim.fn.getpos(".")
    if _should_swap(s_pos, e_pos) then
        s_pos, e_pos = e_pos, s_pos
    end

    local last_line = vim.api.nvim_buf_get_lines(s_pos[1], e_pos[2] - 1, e_pos[2], false)[1]

    local last_col = #last_line

    local lines =  vim.api.nvim_buf_get_text(
                    s_pos[1],
                    s_pos[2] - 1,
                    0,
                    e_pos[2] - 1,
                    last_col, {})
    local text = ""
    for _, line in ipairs(lines) do
      text = text .. line .. "\n"
    end

    local token = vim.fn.input("Token to aling : ")

    local aligned_text = align_token(text,token)
    local string_arr = vim.split(aligned_text, "\n")
    vim.api.nvim_buf_set_text(
        s_pos[1]          ,
        s_pos[2] - 1      ,
        0                 ,
        e_pos[2] - 1      ,
        last_col          ,
        string_arr
    )
    vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
        "x",
        false
    )
end


keymap.set("v","<leader>l", function() aling_token_in_selection() end)

