const hyprland = await Service.import("hyprland")
const notifications = await Service.import("notifications")
const mpris = await Service.import("mpris")
const audio = await Service.import("audio")
const battery = await Service.import("battery")
const systemtray = await Service.import("systemtray")

const date = Variable("", {
    poll: [1000, 'date "+%-I:%M %P %b %e"'],
})

// widgets can be only assigned as a child in one container
// so to make a reuseable widget, make it a function
// then you can simply instantiate one by calling it

function Workspaces(monitor = 0) {
	const activeId = hyprland.active.workspace.bind("id")
	const activeWorkspaces = hyprland.bind("workspaces")
	const activeInfo = Utils.merge([activeId, activeWorkspaces], (a,b) => {
		return [a, b]
	})
	var spaces;
	if (monitor == 0) {
		spaces = [1,2,3,4,5]
	} else {
		spaces = [6,7,8,9,10]
	}
	const workspaces = spaces.map((id) => Widget.Button({
		on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
		child: Widget.Label({
			label: "●",
			class_name: activeInfo.as(a => `${a[0] === id ? "focused" : a[1].some(element => element.id === id) ? "active" : "workspace"}`),
		}),
	}))
	// const workspaces = hyprland.bind("workspaces")
	// 	.as(ws => ws.filter(({ monitorID }) => monitorID == monitor)
	// 		.sort((a, b) => a.id - b.id)
	// 		.map(({ id }) => Widget.Button({
	// 			on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
	// 			child: Widget.Label({
	// 				label: `${id}`,
	// 				class_name: activeId.as(i => `${i === id ? "focused" : "workspace"}`)
	// 			}),
	// 			class_name: activeId.as(i => `${i === id ? "focused" : ""}`),
	// 	})))

    return Widget.Box({
        class_name: "workspaces",
        children: workspaces,
    })
}


function ClientTitle() {
    return Widget.Label({
        class_name: "client-title",
        label: hyprland.active.client.bind("title"),
    })
}


function Clock(calToggle) {
    return Widget.Button({
			class_name: "clockButton",
			on_clicked: calToggle,
			child: Widget.Label({
        class_name: "clock",
        label: date.bind(),
    	})
		})
}


// we don't need dunst or any other notification daemon
// because the Notifications module is a notification daemon itself
function Notification() {
    const popups = notifications.bind("popups")
    return Widget.Box({
        class_name: "notification",
        visible: popups.as(p => p.length > 0),
        children: [
            Widget.Icon({
                icon: "preferences-system-notifications-symbolic",
            }),
            Widget.Label({
                label: popups.as(p => p[0]?.summary || ""),
            }),
        ],
    })
}


// function Media() {
//     const label = Utils.watch("Nothing is playing", mpris, "player-changed", () => {
//         if (mpris.players[0]["track-title"].length > 0) {
//             const { track_artists, track_title } = mpris.players[0]
//             return `${track_artists.join(", ")} - ${track_title}`
//         } else {
//             return "Nothing is playing"
//         }
//     })
//
//     return Widget.Button({
//         class_name: "media",
//         on_primary_click: () => mpris.getPlayer("")?.playPause(),
//         on_scroll_up: () => mpris.getPlayer("")?.next(),
//         on_scroll_down: () => mpris.getPlayer("")?.previous(),
//         child: Widget.Label({ label }),
//     })
// }


function Volume(monitor) {
	const icons = {
		101: "overamplified",
		67: "high",
		34: "medium",
		1: "low",
		0: "muted",
	}

	function getIcon() {
		const icon = audio.speaker.is_muted ? 0 : [101, 67, 34, 1, 0].find(
			threshold => threshold <= audio.speaker.volume * 100)

		return `audio-volume-${icons[icon]}-symbolic`
	}

	const icon = Widget.Icon({
		icon: Utils.watch(getIcon(), audio.speaker, getIcon),
	})

	const button = Widget.Button({
		child: Widget.Box({
			children: [
				icon,
				Widget.Label({
      		label: audio.speaker.bind("volume").as((volume) => `${Math.floor(volume * 100)}%`)
        })
			]
		}),
		on_primary_click_release: () => Utils.execAsync("pavucontrol").catch(print),
    on_secondary_click_release: () => (audio.speaker.is_muted = !audio.speaker.is_muted),
	})

	return Widget.EventBox({
		onScrollUp: () => (audio.speaker.volume += 0.01),
    onScrollDown: () => (audio.speaker.volume -= 0.01),
		class_name: "volume_box",
		child: button,
	})
}


function BatteryLabel() {
    const value = battery.bind("percent").as(p => p > 0 ? p / 100 : 0)
    const icon = battery.bind("percent").as(p =>
        `battery-level-${Math.floor(p / 10) * 10}-symbolic`)

    return Widget.Box({
        class_name: "battery",
        visible: battery.bind("available"),
        children: [
            Widget.Icon({ icon }),
            Widget.LevelBar({
                widthRequest: 140,
                vpack: "center",
                value,
            }),
        ],
    })
}


function SysTray() {
    const items = systemtray.bind("items")
        .as(items => items.map(item => 
						Widget.Button({
							child: Widget.Icon({ icon: item.bind("icon"), class_name: "trayItem" }),
							on_primary_click: (_, event) => item.activate(event),
							on_secondary_click: (_, event) => item.openMenu(event),
							tooltip_markup: item.bind("tooltip_markup"),
        })))

    return Widget.Box({
        children: items,
				class_name: "tray",
    })
}


// layout of the bar
function Left(monitor) {
    return Widget.Box({
        spacing: 8,
        children: [
        ],
    })
}

function Center(monitor) {
    return Widget.Box({
        spacing: 8,
			class_name: "center",
        children: [
            Workspaces(monitor),
        ],
    })
}

function Right(monitor, calToggle) {
    return Widget.Box({
        hpack: "end",
        spacing: 8,
			class_name: "right",
        children: [
            SysTray(),
            Clock(calToggle),
        ],
    })
}

function Bar(monitor = 0, calToggle) {
    return Widget.Window({
        name: `bar-${monitor}`, // name has to be unique
        class_name: "bar",
        monitor,
        anchor: ["bottom", "left", "right"],
				margins: [0,9,9,9],
        exclusivity: "exclusive",
        child: Widget.CenterBox({
            start_widget: Left(monitor),
            center_widget: Center(monitor),
            end_widget: Right(monitor, calToggle),
        }),
    })
}

export { Bar }
