local astal = require("astal")
local Widget = require("astal.gtk3.widget")
local bind = astal.bind
local Network = astal.require("AstalNetwork")

return function()
	local network = Network.get_default()
	local wifi = bind(network, "wifi")

	return Widget.Box({
		class_name = "wifi",
		Widget.Button({
			on_clicked = function()
				astal.exec("wifi-menu")
			end,
			visible = wifi:as(function(v) return v ~= nil end),
			wifi:as(
				function(w)
					return Widget.Icon({
						tooltip_text = bind(w, "ssid"):as(tostring),
						class_name = "wifi",
						icon = bind(w, "icon-name"),
					})
				end
			),
		})
	})
end
