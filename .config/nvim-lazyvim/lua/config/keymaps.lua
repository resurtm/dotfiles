-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disable arrow keys in Normal mode
vim.keymap.set("n", "<Down>", "<Nop>", { noremap = true })
vim.keymap.set("n", "<Left>", "<Nop>", { noremap = true })
vim.keymap.set("n", "<Right>", "<Nop>", { noremap = true })
vim.keymap.set("n", "<Up>", "<Nop>", { noremap = true })

-- Disable arrow keys in Insert mode
vim.keymap.set("i", "<Down>", "<Nop>", { noremap = true })
vim.keymap.set("i", "<Left>", "<Nop>", { noremap = true })
vim.keymap.set("i", "<Right>", "<Nop>", { noremap = true })
vim.keymap.set("i", "<Up>", "<Nop>", { noremap = true })

-- Disable arrow keys in Command mode
vim.keymap.set("c", "<Down>", "<Nop>", { noremap = true })
vim.keymap.set("c", "<Left>", "<Nop>", { noremap = true })
vim.keymap.set("c", "<Right>", "<Nop>", { noremap = true })
vim.keymap.set("c", "<Up>", "<Nop>", { noremap = true })

-- Disable arrow keys in Visual mode
vim.keymap.set("v", "<Down>", "<Nop>", { noremap = true })
vim.keymap.set("v", "<Left>", "<Nop>", { noremap = true })
vim.keymap.set("v", "<Right>", "<Nop>", { noremap = true })
vim.keymap.set("v", "<Up>", "<Nop>", { noremap = true })
