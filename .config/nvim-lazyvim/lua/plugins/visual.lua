return {
  { "ellisonleao/gruvbox.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },
  { "miikanissi/modus-themes.nvim", priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      -- colorscheme = "oxocarbon",
      colorscheme = "cyberdream",
      -- colorscheme = "modus",
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
