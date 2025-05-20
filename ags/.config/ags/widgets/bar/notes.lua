local astal = require("astal")
local Variable = astal.Variable
local Widget = require("astal.gtk3.widget")

return function(format)
	local noteState = Variable(nil):poll(
		1000,
		function()
			if astal.exec("git -C /home/elena/notes status -z") == "" then
				return false
			else
				--print(astal.exec("git -C /home/elena/notes status -z"))
				return true
			end
		end
	)
	local indicator = Widget.Box({
		class_name = "notes",
		visible = noteState(),
		Widget.Icon({
			icon = "folder-notes-symbolic",
		})
	})

	return indicator
end
