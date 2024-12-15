return {
  { "ellisonleao/gruvbox.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
      -- colorscheme = "oxocarbon",
    },
  },
  {
    "lukas-reineke/virt-column.nvim",
    config = function()
      require("virt-column").setup({
        char = "▕",
        virtcolumn = "80,120",
      })
    end,
  },
}
