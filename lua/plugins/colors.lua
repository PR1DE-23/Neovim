return {
  "brenoprata10/nvim-highlight-colors",
  event = "VeryLazy",
  opts = {
    -- Cómo quieres que se pinte el color: 'background', 'foreground' o 'virtual_text'
    render = 'background',
    -- Soporte para colores HEX, RGB, HSL
    enable_hex = true,
    enable_rgb = true,
    enable_hsl = true,
    -- ¡La magia para el desarrollo web!
    -- Si escribes "bg-red-500" o "text-blue-300" de Tailwind, te mostrará el color real.
    enable_tailwind = true,
    -- Ignorar archivos muy grandes para no saturar la memoria del celular
    enable_named_colors = true,
  }
}
