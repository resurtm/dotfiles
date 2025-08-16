return {
  {
    "scottmckendry/cyberdream.nvim",
    priority = 1000,
    opts = {
      cache = true,
      colors = {
        dark_gray = "#272a30",
        mid_gray = "#5f5f5f",
      },
      overrides = function(t)
        return {
          -- https://github.com/scottmckendry/cyberdream.nvim/blob/main/lua/cyberdream/colors.lua#L4
          -- https://github.com/scottmckendry/cyberdream.nvim/blob/main/lua/cyberdream/extensions/base.lua#L43-L45
          -- NormalFloat = { fg = t.fg, bg = t.bg_highlight },
          -- FloatTitle = { fg = t.cyan, bg = t.bg_highlight },
          -- FloatBorder = { fg = t.bg, bg = t.bg_highlight },
          NormalFloat = { fg = t.fg, bg = t.dark_gray },
          FloatTitle = { fg = t.cyan, bg = t.dark_gray },
          FloatBorder = { fg = t.mid_gray, bg = t.dark_gray },
        }
      end,
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      contrast = "hard",
    },
  },
  { "tiagovla/tokyodark.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "miikanissi/modus-themes.nvim" },
  { "zootedb0t/citruszest.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "miasma",
      colorscheme = "cyberdream",
      -- colorscheme = "oxocarbon",
      -- colorscheme = "modus",
      -- colorscheme = "gruvbox",
    },
  },
  {
    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme miasma")
    end,
  },
  -- {
  --   "lukas-reineke/virt-column.nvim",
  --   config = function()
  --     require("virt-column").setup({
  --       char = "▕",
  --       virtcolumn = "80,120",
  --     })
  --   end,
  -- },
}
