-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "Tokyo Night Storm (Gogh)"
-- config.color_scheme = "Tokyo Night (Gogh)"
config.color_scheme = "Gruvbox Dark (Gogh)"

config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 13
local act = wezterm.action

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

config.keys = {
	{
		key = "j",
		mods = "ALT",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = "k",
		mods = "ALT",
		action = act.ActivateTabRelative(1),
	},
	{
		key = ",",
		mods = "ALT",
		action = act.MoveTabRelative(-1),
	},
	{
		key = ".",
		mods = "ALT",
		action = act.MoveTabRelative(1),
	},
	-- Switch to the default workspace
	-- {
	-- 	key = "y",
	-- 	mods = "CTRL|SHIFT",
	-- 	action = act.SwitchToWorkspace({
	-- 		name = "default",
	-- 	}),
	-- },
	-- -- Switch to a monitoring workspace, which will have `top` launched into it
	-- {
	-- 	key = "u",
	-- 	mods = "CTRL|SHIFT",
	-- 	action = act.SwitchToWorkspace({
	-- 		name = "monitoring",
	-- 		spawn = {
	-- 			args = { "top" },
	-- 		},
	-- 	}),
	-- },
	-- -- Create a new workspace with a random name and switch to it
	-- { key = "i", mods = "CTRL|SHIFT", action = act.SwitchToWorkspace },
	-- Show the launcher in fuzzy selection mode and have it list all workspaces
	-- and allow activating one.
	{
		key = "9",
		mods = "ALT",
		action = act.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.window_decorations = "RESIZE"

-- and finally, return the configuration to wezterm
return config
