return {
  {
    "mason.nvim",
    opts = {
      ensure_installed = {
        "ols",
        "wgsl-analyzer",
        "python-lsp-server",
        "mypy",
        "pylint",
        "ruff",
        "black",
        "isort",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json"] = "openapi.yaml",
                ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "openapi.*.yaml",
              },
            },
          },
        },
      },
    },
  },
  -- {
  --   "mfussenegger/nvim-lint",
  --   opts = {
  --     linters_by_ft = {
  --       python = { "mypy", "ruff" },
  --       -- optional things which could be useful for Python
  --       -- python = { "pylint" },
  --     },
  --   },
  -- },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_fix", "ruff_format" },
        -- optional things which could be useful for Python
        -- python = { "black", "isort" },
      },
    },
  },
}
