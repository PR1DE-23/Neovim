return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = { no_italic = true },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme('catppuccin-mocha')
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    name = 'kanagawa',
    priority = 1000,
    enabled = false,
    config = function()
      require('kanagawa').setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = false },
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = { bold = false },
        typeStyle = {},
        transparent = false,
        dimInactive = false,
        terminalColors = true,
      })

      vim.cmd.colorscheme('kanagawa-dragon')
    end,
  }
}
