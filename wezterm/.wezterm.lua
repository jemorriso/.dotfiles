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
-- config.color_scheme = "Gruvbox (Gogh)"

config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 13

config.front_end = "WebGpu"

local act = wezterm.action
local mux = wezterm.mux

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

wezterm.on("gui-startup", function(cmd)
	-- allow `wezterm start -- something` to affect what we spawn
	-- in our initial window
	local args = {}
	if cmd then
		args = cmd.args
	end

	local tab, pane, window = mux.spawn_window({
		workspace = "utils",
		cwd = "~",
	})

	window:spawn_tab({})
	window:spawn_tab({})
	window:spawn_tab({})

	-- -- Set a workspace for coding on a current project
	-- -- Top pane is for the editor, bottom pane is for the build tool
	-- local project_dir = wezterm.home_dir .. '/wezterm'
	-- local tab, build_pane, window = mux.spawn_window {
	--   workspace = 'coding',
	--   cwd = project_dir,
	--   args = args,
	-- }
	-- local editor_pane = build_pane:split {
	--   direction = 'Top',
	--   size = 0.6,
	--   cwd = project_dir,
	-- }
	-- -- may as well kick off a build in that pane
	-- build_pane:send_text 'cargo build\n'
	--
	-- -- A workspace for interacting with a local machine that
	-- -- runs some docker containners for home automation
	-- local tab, pane, window = mux.spawn_window {
	--   workspace = 'automation',
	--   args = { 'ssh', 'vault' },
	-- }
	--
	-- -- We want to startup in the coding workspace
	-- mux.set_active_workspace 'coding'
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
