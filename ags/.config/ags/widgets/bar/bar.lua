local Widget = require("astal.gtk3.widget")
local Anchor = require("astal.gtk3").Astal.WindowAnchor
local BatteryLevel = require("widgets.bar.battery")
local Clock = require("widgets.bar.clock")
local Systray = require("widgets.bar.tray")
local Wifi = require("widgets.bar.wifi")
local Workspaces = require("widgets.bar.workspaces")
local Notes = require("widgets.bar.notes")

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
				Notes(),
			}),
			Widget.Box({
				class_name = "center",
				Workspaces(0),
			}),
			Widget.Box({
				halign = "END",
				class_name = "right",
				Systray(),
				Wifi(),
				BatteryLevel(),
				Clock("%-I:%M %P"),
			}),
		}),
	})
end
