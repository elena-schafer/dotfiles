local astal = require("astal")
local Variable = astal.Variable
local Widget = require("astal.gtk3.widget")
local bind = astal.bind
local Network = astal.require("AstalNetwork")

return function()
	local network = Network.get_default()
	local wifi = bind(network, "wifi")
	local w_icon = bind(wifi:get(), "icon-name")

	local airplane = Variable(""):poll(1000, "bash -c \"rfkill -o SOFT | grep unblocked || true\"")
	local icon = Variable.derive({ airplane, w_icon }, function(a, w)
		if a == "" then
			return "airplane-mode-symbolic"
		elseif a == nil then
			return "airplane-mode-symbolic"
		else
			return w
		end
	end)

	return Widget.Box({
		class_name = "wifi",
		visible = wifi:as(function(v) return v ~= nil end),
		Widget.Button({
			on_clicked = function()
				astal.exec("wifi-menu")
			end,
			Widget.Icon({
				tooltip_text = bind(wifi, "ssid"):as(tostring),
				class_name = "wifi",
				icon = bind(icon):as(tostring)
			})
		})
	})
end
