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

    vim.keymap.set("n","<leader>ff","<cmd>Telescope find_files<CR>", {desc = "find files"})
    vim.keymap.set("n","<leader>ft","<cmd>TodoTelescope<CR>",{  desc = "finds todo comments"})
    vim.keymap.set("n","<leader>fw", function()
          builtin.grep_string({ search = vim.fn.input("Grep > ")})
      end)

    telescope.setup({
      defaults = {
        path_display = { "smart"},
          },
    })

    telescope.load_extension("fzf")
  end,
  } 
