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

-- Interceptar y limpiar el texto de las ventanas de información (Hover)
local default_hover_handler = vim.lsp.handlers["textDocument/hover"]

vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
  if result and result.contents then
    -- Función para colapsar 3 o más saltos de línea consecutivos en solo 2
    local function clean_newlines(str)
      return str:gsub("\n\n\n+", "\n\n")
    end

    -- El protocolo LSP puede enviar el contenido de 3 formas distintas, cubrimos todas:
    if type(result.contents) == "string" then
      result.contents = clean_newlines(result.contents)
    elseif type(result.contents) == "table" and result.contents.value then
      result.contents.value = clean_newlines(result.contents.value)
    elseif type(result.contents) == "table" then
      for i, v in ipairs(result.contents) do
        if type(v) == "string" then
          result.contents[i] = clean_newlines(v)
        elseif type(v) == "table" and v.value then
          v.value = clean_newlines(v.value)
        end
      end
    end
  end

  -- Pasamos el resultado ya limpio al motor original de Neovim
  return default_hover_handler(err, result, ctx, config)
end

for name, config in pairs(servers) do
  local final_cmd = config.cmd
  if name == "csharp_ls" then
    local current_slnx = vim.fs.find(function(n) return n:match("%.slnx$") end, { upward = true, limit = 1 })[1]
    if current_slnx then
      final_cmd = { "csharp-language-server", "--solution-path", current_slnx }
    end
  end

  local custom_on_init = function(client, initialize_result)
    -- Si el servidor ya traía un on_init, lo ejecutamos
    if config.on_init then
      config.on_init(client, initialize_result)
    end

    -- FIX CORREGIDO: Sanitizamos la tabla en lugar de convertirla a booleano
    local diag_cap = client.server_capabilities.diagnosticProvider
    if type(diag_cap) == "table" then
      -- Si documentSelector es el objeto vim.NIL de JSON, lo borramos usando el nil nativo de Lua
      if diag_cap.documentSelector == vim.NIL then
        diag_cap.documentSelector = nil
      end
    end
  end
  vim.lsp.config(name, {
    cmd = final_cmd,
    root_markers = config.root,
    filetypes = config.filetypes,
    init_options = config.init_options,
    settings = config.settings,
    on_init = custom_on_init, -- Inyectamos nuestra función aquí
  })
  vim.lsp.enable(name)
end


vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true,
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
