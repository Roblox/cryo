stds.roblox = {
	read_globals = {"script"}
}

stds.testez = {
	read_globals = {
		"describe", "it",
		"FOCUS", "SKIP",
		"expect",
	}
}

std = "lua51+roblox"

files["**/*.spec.lua"] = {
	std = "+testez",
}