return {
  "nvim-treesitter/nvim-treesitter",
  event = { 'BufReadPost', 'BufNewFile' },
  build = false,
  opts = {
    ensure_installed = {
      "css",
      "scss",
      "json",
      "typescript",
      "tsx",
      "javascript",
      "bash",
      "astro",
      "tsx",
    },
    sync_install = false,
    autoinstall = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = '@function.outer',
          ["if"] = '@function.inner',
          ["ac"] = '@conditional.outer',
          ["ic"] = '@conditional.inner',
          ["al"] = '@loop.outer',
          ["il"] = '@loop.inner',
        }
      }
    }
  }
}
