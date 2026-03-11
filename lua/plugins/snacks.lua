return {
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      dashboard = { enabled = false },
      notifier = { enabled = true },
      scroll = { enabled = true },
      bigfile = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
    keys = {
      {
        "<leader>un",
        function() Snacks.notifier.show_history() end,
        desc = "Historial de Notificaciones"
      },
      {
        "<leader><space>",
        function() Snacks.picker.smart() end,
        desc = "Búsqueda Inteligente"
      },
      {
        "<leader>ff",
        function() Snacks.picker.files() end,
        desc = "Buscar Archivos"
      },
      {
        "<leader>fg",
        function() Snacks.picker.git_files() end,
        desc = "Buscar en Git"
      },
      {
        "<leader>lg",
        function() Snacks.picker.grep() end,
        desc = "Grep (Buscar texto)"
      },
      {
        "<leader>bd",
        function() Snacks.bufdelete() end,
        desc = "Cerrar Buffer (Pestaña)"
      },
      {
        "<leader>t",
        function() Snacks.terminal() end,
        desc = "Terminal Flotante"
      },
      {
        "<leader>z",
        function() Snacks.zen() end,
        desc = "Modo Zen"
      },
      {
        "<leader>e",
      function() Snacks.explorer() end,
        desc = "Explorador de Archivos"
      },
    },
  },
  {
    "sphamba/smear-cursor.nvim",
    opts = {},
  },
}
