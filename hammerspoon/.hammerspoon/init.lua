k = hs.hotkey.modal.new({}, "f19")

k:bind("", "escape", function()
	k:exit()
end)

k:bind("", "a", function()
	hs.application.launchOrFocus("Arc")
	k:exit()
end)

k:bind("", "c", function()
	hs.application.launchOrFocus("Visual Studio Code")
	k:exit()
end)

k:bind("", "f", function()
	hs.application.launchOrFocus("Finder")
	k:exit()
end)

k:bind("", "k", function()
	hs.application.launchOrFocus("kitty")
	k:exit()
end)

k:bind("", "l", function()
	hs.application.launchOrFocus("Ableton Live 11 Suite")
	k:exit()
end)

k:bind("", "m", function()
	hs.application.launchOrFocus("Messages")
	k:exit()
end)

k:bind("", "o", function()
	hs.application.launchOrFocus("Obsidian")
	k:exit()
end)

k:bind("", "p", function()
	hs.application.launchOrFocus("Preview")
	k:exit()
end)

k:bind("", "s", function()
	hs.application.launchOrFocus("Spotify")
	k:exit()
end)

k:bind("", "t", function()
	hs.application.launchOrFocus("Todoist")
	k:exit()
end)
