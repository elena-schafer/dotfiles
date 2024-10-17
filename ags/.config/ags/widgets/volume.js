const audio = await Service.import("audio")


function popup() {
	const slider = Widget.Slider({
		hexpand: true,
		draw_value: false,
		on_change: ({ value }) => audio.speaker.volume = value,
		setup: self => self.hook(audio.speaker, () => {
			self.value = audio.speaker.volume || 0
		}),
	})

	return Widget.Box({
		class_name: "volume-popup",
		css: "min-width: 180px",
		children: [slider],
	})
}

function Volume(monitor = 0) {
    return Widget.Window({
			name: `volume-${monitor}`, // name has to be unique
			class_name: "bar",
			visible: false,
			monitor,
			anchor: ["bottom", "right"],
			margins: [0,200,10,0],
			exclusivity: "exclusive",
			keymode: "none",
			child: popup(),
			setup: self => {
				self.set_focus_on_click(true)
				self.connect("show", (self) => {
					self.set_can_focus(true)
					self.grab_focus()
				})
				self.connect("hide", (self) => self.set_can_focus(false))
				self.connect("focus-out-event", (self, event) => self.visible = false)
			},
		})
 }

export { Volume }
