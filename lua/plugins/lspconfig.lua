return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "Mason", "MasonInstall", "MasonUpdate" },
  dependencies = {
    { "williamboman/mason.nvim", opts = {} }
  },
  config = function()
    local servers = {
      "html", "cssls", "jsonls", "emmet_ls", "ruff", "ts_ls", "tailwindcss", "bashls", "lua_ls"
    }


    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN]  = " ",
          [vim.diagnostic.severity.HINT]  = "󰠠 ",
          [vim.diagnostic.severity.INFO]  = " ",
        }
      },
      virtual_text = false,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded",
        source = "always",
      },
    })

    -- ATAJO: Presiona 'gl' en modo Normal para abrir el cartel flotante y leer el error completo
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Ver diagnóstico flotante" })

    vim.lsp.config("lua_ls", {
      settings = { Lua = { diagnostics = { globals = { "vim" } } } }
    })

    local mason_ts_path = vim.fn.stdpath("data") ..
        "/mason/packages/typescript-language-server/node_modules/typescript/lib"

    vim.lsp.config("astro", {
      init_options = {
        typescript = {
          tsdk = mason_ts_path
        }
      }
    })

    for _, name in ipairs(servers) do
      vim.lsp.enable(name)
    end

    vim.lsp.enable("astro")
  end
}
