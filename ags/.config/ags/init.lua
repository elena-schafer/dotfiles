local App = require("astal.gtk3.app")
local astal = require("astal")
local bar = require("widgets.bar.bar")

local scss = "./style/style.scss"
local css = "/tmp/style.css"

astal.exec(string.format("sass %s %s", scss, css))

App:start {
	css = css,
	main = function()
		bar(0)
	end,
}
