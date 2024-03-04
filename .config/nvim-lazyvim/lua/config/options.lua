-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local vim = vim
local opt = vim.opt

-- code folding: https://www.jmaguire.tech/posts/treesitter_folding/
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- prevent conceal of some Markdown related stuff, it's rather annoying than helpful
-- https://github.com/preservim/vim-markdown/issues/253#issuecomment-181247898
opt.conceallevel = 0
