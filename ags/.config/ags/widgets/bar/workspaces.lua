local astal = require("astal")
local Widget = require("astal.gtk3.widget")
local bind = astal.bind
local Hyprland = astal.require("AstalHyprland")
local map = require("lib").map

return function()
	local hypr = Hyprland.get_default()

	return Widget.Box({
		class_name = "workspaces",
		bind(hypr, "workspaces"):as(function(wss)
			table.sort(wss, function(a, b) return a.id < b.id end)

			return map(wss, function(ws)
				if not (ws.id >= -99 and ws.id <= -2) then -- filter out special workspaces
					return Widget.Button({
						class_name = bind(hypr, "focused-workspace"):as(
							function(fw) return fw == ws and "workspace-focused" or "workspace" end
						),
						on_clicked = function() ws:focus() end,
						label = "●",
					})
				end
			end)
		end),
	})
end
