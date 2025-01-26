return {
  {
    "scottmckendry/cyberdream.nvim",
    priority = 1000,
    opts = {
      cache = true,
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      contrast = "hard",
    },
  },
  -- { "tiagovla/tokyodark.nvim" },
  -- { "nyoom-engineering/oxocarbon.nvim" },
  -- { "miikanissi/modus-themes.nvim" },
  -- { "zootedb0t/citruszest.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "cyberdream",
      colorscheme = "gruvbox",
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
