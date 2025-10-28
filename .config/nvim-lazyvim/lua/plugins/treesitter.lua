-- stylua: ignore
if true then return {} end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "wgsl",
      })
    end,
  },
}
