return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- dashboard = { enabled = true },
    bigfile = { enabled = true },
    explorer = { enabled = true },
    statuscolumn = { enabled = true },
    indent = { enabled = true },
    words = { enabled = true },
    picker = { 
      enabled = true,
      sources = {
        explorer = {
          layout = { layout = { position = "right" } }
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
      function() Snacks.picker.notification() end, 
      desc = "Notification History" 
    },
    { 
      "<leader>e", 
      function() Snacks.explorer() end, 
      desc = "File Explorer" 
    },
  },
}
