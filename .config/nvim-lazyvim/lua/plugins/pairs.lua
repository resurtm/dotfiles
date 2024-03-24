return {
  -- we no longer need the "mini.pairs" plugin, which is pre-bundled with LazyVim
  {
    "mini.pairs",
    enabled = false,
  },

  -- the "ultimate-autopair" is much better and much more comfortable
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6",
    opts = {},
  },
}
