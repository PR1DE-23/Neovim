return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {
    -- La configuración por defecto ya es excelente.
    -- Escribe en tu código comentarios como:
    -- TODO: Hacer este formulario responsivo
    -- FIXME: El botón de enviar no funciona
    -- BUG: Error de validación
    -- HACK: Solución temporal, revisar después
  }
}
