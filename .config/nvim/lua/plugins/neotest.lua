return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      -- begin: neotest-golang
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = function() vim.cmd ":TSUpdate go" end,
      },
      {
        "fredrikaverpil/neotest-golang",
        version = "*",
        build = function() vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() end,
      },
      -- end: neotest-golang
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      table.insert(opts.adapters, require "rustaceanvim.neotest")
      table.insert(
        opts.adapters,
        require "neotest-golang" {
          runner = "gotestsum",
        }
      )
    end,
  },
}
