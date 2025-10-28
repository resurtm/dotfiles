-- stylua: ignore
if true then return {} end

return {
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    opts = function(_, opts)
      local actions = require("fzf-lua.actions")
      return vim.tbl_deep_extend("force", opts, {
        files = {
          cwd_prompt = false,
          actions = {
            ["ctrl-i"] = { actions.toggle_ignore },
            ["ctrl-h"] = { actions.toggle_hidden },
          },
        },
        grep = {
          hidden = true,
          actions = {
            ["ctrl-i"] = { actions.toggle_ignore },
            ["ctrl-h"] = { actions.toggle_hidden },
          },
        },
      })
    end,
  },
}
