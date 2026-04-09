return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern", -- Usa un diseño flotante y limpio
    delay = 600, -- Espera 0.6 segundos antes de aparecer. Si escribes rápido, no te estorba.
    win = {
      padding = { 1, 1, 1, 1 }, -- Márgenes mínimos para aprovechar la pantalla del celular
    },
    -- Si los iconos se ven raros, descomenta la siguiente línea:
    -- icons = { mappings = false },
  },
}
