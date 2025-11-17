return {
  {
    "linux-cultist/venv-selector.nvim",
    -- dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    dependencies = { "neovim/nvim-lspconfig", "mfussenegger/nvim-dap-python" },
    opts = {},
    keys = {},
    config = function(_, _)
      require("venv-selector").setup({
        settings = {
          search = {
            anaconda_envs = {
              -- anaconda envs
              command = "fd bin/python$ /opt/homebrew/anaconda3/envs --full-path --color never -E /proc",
            },
            anaconda_base = {
              -- anaconda base env
              command = "fd /python$ /opt/homebrew/anaconda3/bin --full-path --color never -E /proc",
            },
          },
        },
      })
    end,
  },
}
