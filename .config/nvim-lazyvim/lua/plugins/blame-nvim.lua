return {
  {
    "FabijanZulj/blame.nvim",
    opts = {
      merge_consecutive = true,
    },
    keys = {
      { "<leader>gb", "<cmd>EnableBlame virtual<cr>", desc = "enable, blame for all LOCs" },
      { "<leader>gB", "<cmd>DisableBlame<cr>", desc = "enable, blame for all LOCs" },
    },
  },
}
