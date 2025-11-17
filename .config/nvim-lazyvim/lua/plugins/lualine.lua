return {
  {
    -- https://www.lazyvim.org/plugins/ui#lualinenvim
    "nvim-lualine/lualine.nvim",
    opts = function()
      local icons = LazyVim.config.icons
      return {
        sections = {
          lualine_c = {
            LazyVim.lualine.root_dir(),
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            -- custom setting
            { LazyVim.lualine.pretty_path({ length = 10 }) },
          },
        },
      }
    end,
  },
}
