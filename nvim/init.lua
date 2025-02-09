dofile("/home/jakub/.config/nvim/core/options.lua")
--constant path for options.lua so it is loaded outside config directory

dofile("/home/jakub/.config/nvim/core/keymaps.lua")
--path for keymap settings


--lazy setup 

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


--strats lazy
--setup includes plugins

require("lazy").setup({
 {"nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons"
  }

})

--plugin settings
--all in init.lua cuz i cant setup my paths propertly

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})










