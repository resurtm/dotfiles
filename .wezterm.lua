local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font",
})

-- config.color_scheme = 'AdventureTime'

return config
