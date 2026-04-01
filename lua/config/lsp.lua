vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

local servers = {
  html = {
    cmd = {"vscode-html-language-server", "--stdio"},
    root = {"package.json", "index.html"},
    filetypes = {"html", "astro"}
  },
  cssls = {
    cmd = {"vscode-css-language-server", "--stdio"},
    root = {"package.json"},
    filetypes = {"css", "scss"}
  },
  jsonls = {
    cmd = {"vscode-json-language-server", "--stdio"},
    root = {"package.json"},
    filetypes = {"json"}
  },
  emmet_ls = {
    cmd = {"emmet-ls", "--stdio"},
    root = {"package.json", ".git"},
    filetypes = {"html", "css", "scss"}
  },
  astro = {
    cmd = { "astro-ls", "--stdio" },
    root = { "astro.config.js", "astro.config.mjs", "astro.config.js" },
    filetypes = {"astro"},
    init_options = {
      typescript = {
        tsdk = vim.fn.expand('$HOME/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib')
      }
    }
  },
  tailwindcss = {
    cmd = {"tailwindcss-language-server", "--stdio"},
    root = {"tailwind.config.js", "tailwind.config.ts", "postcss.config.js"},
    filetypes = {"html", "css", "javascript", "typescript", "vue"}
  },
  ts_ls = {
    cmd = {"typescript-language-server", "--stdio"},
    root = {"tsconfig.json", "jsconfig.json", "package.json"},
    filetypes = {"typescript", "javascript", "typescriptreact", "javascriptreact"}
  },
  marksman = {
    cmd = {"marksman", "server"},
    root = {"marksman.toml", ".git"},
    filetypes = {"markdown"}
  },
  lua_ls = {
    cmd = {"lua-language-server"},
    root = {".luarc.json", "init.lua"},
    filetypes = {"lua"},
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" }
        },
        workspace = {
          checkThirdParty = false
        }
      }
    }
  }
}

for name, config in pairs(servers) do
  local root_dir = vim.fs.root(0, config.root)
  if root_dir then
    vim.lsp.config(name, {
      cmd = config.cmd,
      root_dir = root_dir,
      filetypes = config.filetypes,
      init_options = config.init_options,
      settings = config.settings
    })
    vim.lsp.enable(name)
  end
end

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = false,
  underline = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  },
  update_in_insert = false,
  severity_sort = true,
})
