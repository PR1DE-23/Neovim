return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- Usar la última versión para tener correcciones de ARM64
  opts = {
    provider = "gemini",
    providers = {
      gemini = {
        model = "gemini-1.5-flash", -- O "gemini-1.5-pro" si quieres más potencia
        max_tokens = 4096,
        temperature = 0,
      },
    },
    behaviour = {
      auto_suggestions = false, -- Desactívalo si prefieres usar otra cosa para FIM
      support_paste_from_clipboard = true,
    },
  },
  -- ESTO ES LO MÁS IMPORTANTE PARA TERMUX
  build = "make BUILD_FROM_SOURCE=true",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- dependencias opcionales
    "nvim-tree/nvim-web-devicons",
    {
      -- Soporte para imágenes (requiere que instales 'imagemagick' vía pkg)
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = { insert_mode = true },
        },
      },
    },
  },
}
