return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")

    -- 1. Configuración limpia del plugin
    neocodeium.setup({
      -- Aquí puedes meter opciones nativas del plugin si quieres más adelante
    })

    -- 2. PARCHE PARA TERMUX (Va AFUERA del setup)
    vim.api.nvim_create_autocmd("VimLeavePre", {
      group = vim.api.nvim_create_augroup("FixNeoCodeiumTermux", { clear = true }),
      callback = function()
        pcall(function()
          neocodeium.stop()
        end)
      end,
    })

    -- 3. Configuración de Atajos de Teclado (Keymaps)
    vim.keymap.set("i", "<A-l>", function()
      neocodeium.accept()
    end, { desc = "NeoCodeium: Aceptar sugerencia" })

    vim.keymap.set("i", "<A-w>", function()
      neocodeium.accept_word()
    end, { desc = "NeoCodeium: Aceptar palabra" })

    vim.keymap.set("i", "<A-j>", function()
      neocodeium.accept_line()
    end, { desc = "NeoCodeium: Aceptar línea" })

    vim.keymap.set("i", "<A-f>", function()
      neocodeium.cycle_or_complete()
    end, { desc = "NeoCodeium: Siguiente sugerencia" })

    vim.keymap.set("i", "<A-d>", function()
      neocodeium.cycle_or_complete(-1)
    end, { desc = "NeoCodeium: Sugerencia anterior" })

    vim.keymap.set("i", "<A-c>", function()
      neocodeium.clear()
    end, { desc = "NeoCodeium: Limpiar sugerencia" })
  end,
}
