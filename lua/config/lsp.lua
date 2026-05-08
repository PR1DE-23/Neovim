local servers = {
  html = {
    cmd = { "vscode-html-language-server", "--stdio" },
    root = { "package.json", "index.html" },
    filetypes = { "html", "astro" }
  },
  cssls = {
    cmd = { "vscode-css-language-server", "--stdio" },
    root = { "package.json" },
    filetypes = { "css", "scss" }
  },
  jsonls = {
    cmd = { "vscode-json-language-server", "--stdio" },
    root = { "package.json" },
    filetypes = { "json" }
  },
  emmet_ls = {
    cmd = { "emmet-ls", "--stdio" },
    root = { "package.json", ".git" },
    filetypes = { "html", "css", "scss" }
  },
  --eslint = {
  --cmd = { "vscode-eslint-language-server", "--stdio" },
  --root = { ".eslintrc", ".eslintrc.js", ".eslintrc.json", "eslint.config.js", "eslint.config.mjs" },
  --filetypes = { "javascript", "typescript", "astro" }
  --},
  astro = {
    cmd = { "astro-ls", "--stdio" },
    root = { "astro.config.js", "astro.config.mjs", "astro.config.js" },
    filetypes = { "astro" },
    init_options = {
      typescript = {
        tsdk = os.getenv("PNPM_HOME") .. "/global/5/node_modules/typescript/lib"
      }
    }
  },
  tailwindcss = {
    cmd = { "tailwindcss-language-server", "--stdio" },
    root = { "tailwind.config.js", "tailwind.config.ts", "postcss.config.js" },
    filetypes = { "html", "css", "javascript", "typescript", "vue" }
  },
  ts_ls = {
    cmd = { "typescript-language-server", "--stdio" },
    root = { "tsconfig.json", "jsconfig.json", "package.json" },
    filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
  },
  markdown_oxide = {
    cmd = { "markdown-oxide" },
    root = { ".git", ".obsidian", "marksman.toml" },
    filetypes = { "markdown" }
  },
  bashls = {
    cmd = { "bash-language-server", "start" },
    root = { ".git" },
    filetypes = { "sh", "zsh", "bash" }
  },
  yamlls = {
    cmd = { "yaml-language-server", "--stdio" },
    root = { ".git" },
    filetypes = { "yaml" }
  },
  lua_ls = {
    cmd = { "lua-language-server" },
    root = { ".luarc.json", "init.lua" },
    filetypes = { "lua" },
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

local capabilities = vim.lsp.protocol.make_client_capabilities()

for name, config in pairs(servers) do
  vim.lsp.config(name, {
    cmd = config.cmd,
    root_markers = config.root,
    filetypes = config.filetypes,
    init_options = config.init_options,
    settings = config.settings,
    capabilities = capabilities,
  })
  vim.lsp.enable(name)
end

vim.diagnostic.config({
  virtual_text = false,
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
