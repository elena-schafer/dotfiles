local App = require("astal.gtk3.app")
local bar = require("widgets.bar.bar")

App:start {
	css = "./style/style.css",
	main = function()
		bar(0)
	end,
}
