local App = require("astal.gtk3.app")
local bar = require("widgets.bar.bar")

App:start {
	main = function()
		bar(0)
	end,
}
