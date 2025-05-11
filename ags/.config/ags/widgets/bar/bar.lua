local Widget = require("astal.gtk3.widget")
local Anchor = require("astal.gtk3").Astal.WindowAnchor
local BatteryLevel = require("widgets.bar.battery")
local Clock = require("widgets.bar.clock")
local Systray = require("widgets.bar.tray")

return function(monitor)
	return Widget.Window({
		monitor = monitor,
		class_name = "bar",
		margin_bottom = 9,
		margin_left = 9,
		margin_right = 9,
		anchor = Anchor.BOTTOM + Anchor.LEFT + Anchor.RIGHT,
		exclusivity = "EXCLUSIVE",
		Widget.CenterBox({
			Widget.Box({
				halign = "START",
				class_name = "left",
				-- Workspaces(),
			}),
			Widget.Box({
				class_name = "center",
			}),
			Widget.Box({
				halign = "END",
				class_name = "right",
				Systray(),
				BatteryLevel(),
				Clock("%-I:%M %P"),
			}),
		}),
	})
end
