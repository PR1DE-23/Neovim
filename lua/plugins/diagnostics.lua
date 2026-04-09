return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function()
    require('tiny-inline-diagnostic').setup({
      preset = "modern",
      options = {
        show_all_diags_on_cursorline = true,
        multilined = true,
      }
    }) -- Aquí está la corrección: }) en lugar de end)
  end
}
