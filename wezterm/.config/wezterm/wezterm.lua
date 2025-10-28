local wezterm = require("wezterm")
return {
	-- color_scheme = 'termnial.sexy',
	color_scheme = "Tokyo Night Storm",
	enable_tab_bar = false,
	font_size = 19.0,
	font = wezterm.font("JetBrains Mono"),
	-- macos_window_background_blur = 40,
	macos_window_background_blur = 30,
	native_macos_fullscreen_mode = true,
	initial_cols = 200, -- You can adjust the size as needed
	initial_rows = 100, -- You can adjust the size as needed

	-- window_background_image = '/Users/omerhamerman/Downloads/3840x1080-Wallpaper-041.jpg',
	-- window_background_image_hsb = {
	-- 	brightness = 0.01,
	-- 	hue = 1.0,
	-- 	saturation = 0.5,
	-- },
	-- window_background_opacity = 0.92,
	window_background_opacity = 1.0,
	-- window_background_opacity = 0.78,
	-- window_background_opacity = 0.20,
	window_decorations = "RESIZE",
	keys = {
		{
			key = "g",
			mods = "CMD",
			action = wezterm.action.ToggleFullScreen,
		},
		-- { key = "i", mods = "CMD", action = wezterm.action({ SendString = "\x1b[200;5u" }) },
		-- { key = "o", mods = "CMD", action = wezterm.action({ SendString = "\x0f" }) },

		--     map super+o send_text all \x0f
		-- map super+i send_text all \x1b[105;5u #\x1b[105;6u
		--
		{
		  key = "j",
		  mods = "CMD",
		  action = wezterm.action.SendKey({ key = "j", mods = "ALT" }),
		},
		{
		  key = "k",
		  mods = "CMD",
		  action = wezterm.action.SendKey({ key = "k", mods = "ALT" }),
		},

		{
			key = "i",
			mods = "CMD",
			action = wezterm.action.SendKey({ key = "i", mods = "ALT" }),
		},

		{
			key = "o",
			mods = "CMD",
			action = wezterm.action.SendKey({ key = "o", mods = "ALT" }),
		},

		{
			key = "a",
			mods = "CMD",
			action = wezterm.action.SendKey({ key = "a", mods = "ALT" }),
		},

		{
			key = "s",
			mods = "CMD",
			action = wezterm.action.SendKey({ key = "s", mods = "ALT" }),
		},

		{
			key = "d",
			mods = "CMD",
			action = wezterm.action.SendKey({ key = "d", mods = "ALT" }),
		},

		{
			key = "f",
			mods = "CMD",
			action = wezterm.action.SendKey({ key = "f", mods = "ALT" }),
		},
	},
	mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
}
