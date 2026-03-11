return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require"nvim-treesitter.configs".setup {
      ensure_installed = {
        "html",
        "css",
        "typescript",
        "lua",
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
      }
    }
  end
}
