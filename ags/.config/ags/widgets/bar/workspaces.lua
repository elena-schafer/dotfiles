local astal = require("astal")
local Widget = require("astal.gtk3.widget")
local bind = astal.bind
local Hyprland = astal.require("AstalHyprland")
local map = require("lib").map


return function(monitor)
	local hypr = Hyprland.get_default()
	local activeWorkspaces = bind(hypr, "workspaces")
	local spaces = {}
	if monitor == 0 then
		spaces = { 1, 2, 3, 4, 5 }
	else
		spaces = { 6, 7, 8, 9, 10 }
	end

	-- could be replaces with a general search table function
	function getActive(space)
		for index, value in ipairs(activeWorkspaces) do
			if space == value.id then
				return value
			end
		end
		return nil
	end

	return Widget.Box({
		class_name = "workspaces",
		map(spaces, function(space)
			return Widget.Button({
				class_name = bind(hypr, "focused-workspace"):as(
					function(fw) return fw.id == space and "workspace-focused" or "workspace" end
				),
				on_clicked = function() hypr:message_async("dispatch workspace " .. space) end,
				label = "●",
			})
		end)
	})
end
