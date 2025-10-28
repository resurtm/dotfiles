-- stylua: ignore
if true then return {} end

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  -- remove this once this issue is fixed: https://github.com/yioneko/vtsls/issues/159
  opts = {
    routes = {
      {
        filter = {
          event = "notify",
          find = "Request textDocument/inlayHint failed",
        },
        opts = { skip = true },
      },
    },
  },
}
