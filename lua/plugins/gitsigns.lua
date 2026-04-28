return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    signcolumn = true,
    numhl = true,
    max_file_length = 10000,
  }
}
