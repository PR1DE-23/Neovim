-- TECLAS LIDER
vim.g.mapleader               = " "
vim.g.maplocalleader          = " "

-- RENDIMIENTO Y LIMPIEZA
vim.g.loaded_node_provider    = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider    = 0
vim.g.loaded_ruby_provider    = 0

local opt                     = vim.opt

-- INTERFAZ DE USUARIO (UI)
opt.number                    = true
opt.relativenumber            = true
opt.cursorline                = true
opt.termguicolors             = true
opt.swapfile                  = false

-- COMPORTAMIENTO DEL CÓDIGO (Indentación)
opt.tabstop                   = 2
opt.shiftwidth                = 2
opt.expandtab                 = true
opt.smartindent               = true

-- BUSQUEDA Y NAVEGACIÓN
opt.ignorecase                = true
opt.smartcase                 = true
opt.hlsearch                  = false
opt.mouse                     = "a"

-- INTEGRACIÓN CON PORTAPAPELES DE TERMUX
vim.g.clipboard               = {
  name = "termux-clipboard",
  copy = {
    ["+"] = "termux-clipboard-set",
    ["*"] = "termux-clipboard-set",
  },
  paste = {
    ["+"] = "termux-clipboard-get",
    ["*"] = "termux-clipboard-get",
  },
  cache_enabled = true,
}

-- DIAGNÓSTICOS (Errores de código)
vim.diagnostic.config({
  virtual_text = false
})
