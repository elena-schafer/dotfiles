local astal = require("astal")
local Variable = astal.Variable
local GLib = astal.require("GLib")
local Widget = require("astal.gtk3.widget")

return function(format)
	local time = Variable(""):poll(
		1000,
		function() return GLib.DateTime.new_now_local():format(format) end
	)

	return Widget.Box({
		class_name = "clock",
		Widget.Button({
			Widget.Label({
				on_destroy = function() time:drop() end,
				label = time()
			}),
		}),
	})
end
