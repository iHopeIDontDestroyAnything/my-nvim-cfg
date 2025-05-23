return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")


    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),

      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }


        -- set keybinds
        opts.desc = "Go to declaration"
        keymap.set("n", "gd", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, opts) -- show diagnostics for line

        opts.desc = "Go to prev diagnostic"
        keymap.set("n", "<leader>pd", vim.diagnostic.goto_prev, opts) -- show diagnostics for line
       
        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.diagnostic.config{
    virtual_text = false,  -- floating text next to code is too noisy.
    underline = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN]  = "",
        },
        linehl = {
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
        },
        numhl = {
            [vim.diagnostic.severity.WARN] = 'WarningMsg',
        },
    },
}
    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
          settings = {
          },
        })
      end,
  ["clangd"] = function()
      -- local lspconfig = require("lspconfig")
      lspconfig.clangd.setup {
          cmd = { 
              -- "/home/jakub/.espressif/tools/esp-clang/esp-19.1.2_20250312/esp-clang/bin/clangd",
              "clangd", 
              "--header-insertion=never", 
              "--completion-style=detailed",
              -- "--background-index",
              "--query-driver=/usr/bin/arm-none-eabi-gcc",
              -- "--query-driver=/home/jakub/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/**/bin/xtensa-esp32-elf-*",
              -- "--query-driver=/home/jakub/.espressif/tools/xtensa-esp-elf/esp-14.2.0_20241119/xtensa-esp-elf/bin/xtensa-esp-elf-*",
          },
      }
  end,
  ["pyright"] = function()
      -- local lspconfig = require("lspconfig")
      lspconfig.pyright.setup {
          settings = {
            pyright = {autoImportCompletion = true},
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = 'openFilesOnly',
                useLibraryCodeForTypes = true,
                typeCheckingMode = 'off'}
            }
          }
        }  
      end,
    })
  end,
}
