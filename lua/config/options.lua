vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline  = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.swapfile = false
vim.diagnostic.config({
  virtual_text = true
})
vim.g.clipboard = {
  name = "termux-clipboard",
  copy = {
    ["+"] = "termux-clipboard-set",
    ["*"] = "termux-clipboard-set",
  },
  paste = {
    ["+"] = "termux-clipboard-get",
    ["*"] = "termux-clipboard-get",
  },
  cache_enabled = false,
}

-- Desactivar proveedores heredados para acelerar el inicio y limpiar checkhealth
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
