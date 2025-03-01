return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local treeSitter = require("nvim-treesitter.configs")
    treeSitter.setup({
      highlight = {
        enable = true,
      },
      indent = { enable = true},
      ensure_installed = {
          "bash",
          "c",
          "diff",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "jsonc",
          "lua",
          "python",
          "typescript",
          "vim",
          "vimdoc",
          "xml",
          "cpp",
          "css",
          "c_sharp",
          "java",
      },
    })
  end,
  }





