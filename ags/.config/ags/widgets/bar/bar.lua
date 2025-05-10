local Widget = require("astal.gtk3.widget")
local Anchor = require("astal.gtk3").Astal.WindowAnchor
local battery = require("widgets.bar.battery")

return function(monitor)
	return Widget.Window({
		monitor = monitor,
		anchor = Anchor.BOTTOM + Anchor.LEFT + Anchor.RIGHT,
		exclusivity = "EXCLUSIVE",
		battery(),
	})
end
