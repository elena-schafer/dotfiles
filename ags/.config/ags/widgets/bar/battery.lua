local astal = require("astal")
local bind = astal.bind
local Widget = require("astal.gtk3.widget")
local Battery = astal.require("AstalBattery")

return function()
	local bat = Battery.get_default()
	local value = bind(bat, "percentage"):as(function(p)
		return string.format("%.0f%%", p * 100)
	end)
	-- Code for making icon of battery
	-- local icon = bind(bat, "percentage"):as(function(p)
	-- 	return "battery-level-" .. math.floor(p * 10) * 10 .. "-symbolic"
	-- end)
	return Widget.Box({
		Widget.Label({
			label = value
		}),
	})
end
