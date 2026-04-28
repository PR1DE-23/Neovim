-- NAVEGACIÓN DE BUFFERS
vim.keymap.set('n', 'gb', ':bn<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gB', ':bp<CR>', { noremap = true, silent = true })

-- PORTAPAPELES (Sincronización manual con el sistema)
-- "y" normal copiará al registro interno de Neovim (instantáneo)
-- "<leader>y" enviará el texto a Android/PC (vía termux-clipboard)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copiar al portapapeles del sistema" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copiar línea al portapapeles del sistema" })

-- "<leader>p" traerá el texto desde el sistema a Neovim
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Pegar desde el portapapeles del sistema" })
