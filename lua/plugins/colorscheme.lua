return {
  'rebelot/kanagawa.nvim',
  name = 'kanagawa',
  lazy = false,
  priority = 1000,
  config = function()
    require('kanagawa').setup({
      compile = false,
      undercurl = true,
      commentStyle = { italic = false },
      functionStyle = { italic = false },
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
