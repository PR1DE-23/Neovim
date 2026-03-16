vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

local servers = {
  html = {
    cmd = {"vscode-html-language-server", "--stdio"},
    root = {"package.json", "index.html"}
  },
  cssls = {
    cmd = {"vscode-css-language-server", "--stdio"},
    root = {"package.json"}
  },
  jsonls = {
    cmd = {"vscode-json-language-server", "--stdio"},
    root = {"package.json"}
  },
  emmet_ls = {
    cmd = {"emmet-ls", "--stdio"},
    root = {"package.json", ".git"}
  },
  astro = {
    cmd = { "astro-ls", "--stdio" },
    root = { "astro.config.js", "astro.config.mjs", "astro.config.js" },
    init_options = {
      typescript = {
        tsdk = vim.fn.expand('$HOME/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib')
      }
    }
  },
  tailwindcss = {
    cmd = {"tailwindcss-language-server", "--stdio"},
    root = {"tailwind.config.js", "tailwind.config.ts", "postcss.config.js"}
  },
  ts_ls = {
    cmd = {"typescript-language-server", "--stdio"},
    root = {"tsconfig.json", "jsconfig.json", "package.json"}
  },
  marksman = {
    cmd = {"marksman", "server"},
    root = {"marksman.toml", ".git"}
  },
  lua_ls = {
    cmd = {"lua-language-server"},
    root = {".luarc.json", "init.lua"},
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

local filetypes = {
  html = { 'html', 'astro' },
  cssls = { 'css', 'scss' },
  jsonls = { 'json' },
  emmet_ls = { 'html', 'css', 'scss' },
  astro = { 'astro' },
  tailwindcss = { 'html', 'css', 'javascript', 'typescript', 'vue' },
  ts_ls = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
  marksman = { 'markdown' },
  lua_ls = { 'lua' }
}

for name, config in pairs(servers) do
  if vim.tbl_contains(filetypes[name] or {}, vim.bo.filetype) then
    local root_dir = vim.fs.root(0, config.root)
    if root_dir then
      vim.lsp.config(name, {
        cmd = config.cmd,
        root_dir = root_dir,
        init_options = config.init_options,
        settings = config.settings
      })
      vim.lsp.enable(name)
    end
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
