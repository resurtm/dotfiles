return {
  {
    "FabijanZulj/blame.nvim",
    opts = {
      merge_consecutive = true,
    },
    keys = {
      { "<leader>gb", "<cmd>EnableBlame virtual<cr>", desc = "enable, LOCs blame" },
      { "<leader>gB", "<cmd>DisableBlame<cr>", desc = "disable, LOCs blame" },
    },
  },
}
