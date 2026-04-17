return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    scroll = { enabled = true },
    bigfile = { enabled = true },
    explorer = { enabled = true },
    statuscolumn = { enabled = true },
    indent = { enabled = true },
    words = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          layout = {
            layout = {
              position = "float",
              row = 1,
              col = 999,
              border = "left",
              width = 35,
              height = vim.o.lines - 3,
              box = "vertical",
              { win = "input", height = 1,     border = "bottom" },
              { win = "list",  border = "none" },
            }
          }
        }
      }
    },
  },
  keys = {
    {
      "<leader><space>",
      function() Snacks.picker.smart() end,
      desc = "Smart Find Files"
    },
    {
      "<leader>,",
      function() Snacks.picker.buffers() end,
      desc = "Buffers"
    },
    {
      "<leader>/",
      function() Snacks.picker.grep() end,
      desc = "Grep"
    },
    {
      "<leader>:",
      function() Snacks.picker.command_history() end,
      desc = "Command History"
    },
    {
      "<leader>n",
      function() Snacks.picker.notifications() end,
      desc = "Notification History"
    },
    {
      "<leader>e",
      function() Snacks.explorer() end,
      desc = "File Explorer"
    },
  },
}
