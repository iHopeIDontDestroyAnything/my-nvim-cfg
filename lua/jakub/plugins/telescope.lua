return
  {"nvim-telescope/telescope.nvim",
  branch = "0.1.x", 
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
    "BurntSushi/ripgrep",
  },
  config = function()
    local telescope =  require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    local utils = require("telescope.utils")

    vim.keymap.set("n","<leader>ff",function() builtin.find_files({}) end, {desc = "find files"})

    vim.keymap.set("n","<leader>fc",function() builtin.find_files({
                                                                  cwd = utils.buffer_dir(),
                                                                  }) end, {desc = "find files relative to current buffer"})

    vim.keymap.set("n","<leader>fa",function() builtin.find_files({
                                                                  hidden = true,
                                                                  no_ignore = true,
                                                                  }) end, {desc = "find all files"})


    vim.keymap.set("n","<leader>fw", function()
          builtin.grep_string({ search = vim.fn.input("Grep : ")})
      end)

    telescope.setup({
      defaults = {
        path_display = { "absolute"},
          },
    })

    telescope.load_extension("fzf")
  end,
  } 
