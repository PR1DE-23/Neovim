local servers = {
  html = {
    cmd = { "vscode-html-language-server", "--stdio" },
    root = { "package.json", "index.html" },
    filetypes = { "html", "astro" },
    init_options = {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = { css = true, javascript = true },
      provideFormatter = true,
    },
    settings = {
      html = { validate = true }
    }
  },
  cssls = {
    cmd = { "vscode-css-language-server", "--stdio" },
    root = { "package.json" },
    filetypes = { "css", "scss", "html" },
    settings = {
      css = { validate = true }
    }
  },
  jsonls = {
    cmd = { "vscode-json-language-server", "--stdio" },
    root = { "package.json" },
    filetypes = { "json" },
    settings = {
      json = {
        validate = { enable = true }
      }
    }
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
  ruff = {
    cmd = { "ruff", "server" },
    root = { "pyproject.toml", "setup.py", "requirements.txt", ".git" },
    filetypes = { "python" }
  },
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
  },
  csharp_ls = {
    cmd = { "csharp-language-server" }, -- Comando base
    root = { ".git", "bin", "obj" },
    filetypes = { "cs" }
  },
}

for name, config in pairs(servers) do
  local final_cmd = config.cmd
  if name == "csharp_ls" then
    local current_slnx = vim.fs.find(function(n) return n:match("%.slnx$") end, { upward = true, limit = 1 })[1]
    if current_slnx then
      final_cmd = { "csharp-language-server", "--solution-path", current_slnx }
    end
  end
  vim.lsp.config(name, {
    cmd = final_cmd,
    root_markers = config.root,
    filetypes = config.filetypes,
    init_options = config.init_options,
    settings = config.settings,
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
