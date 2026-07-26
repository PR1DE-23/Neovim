return {
  'dgagn/diagflow.nvim',
  event = 'LspAttach',
  opts = {
    show_borders = true,
    border_chars = {
      top_left = "┌",
      top_right = "┐",
      bottom_left = "└",
      bottom_right = "┘",
      horizontal = "─",
      vertical = "│"
    },
    toggle_event = { 'InsertEnter', 'InsertLeave' },
  }
}
