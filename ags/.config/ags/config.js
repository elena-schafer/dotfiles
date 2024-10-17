import { Bar } from "./widgets/bar.js"
import {NotificationPopups } from "./widgets/notifications.js"
import { Volume } from "./widgets/volume.js"
import { calendar } from "./widgets/calendar.js"

const calendar0 = calendar(0)
const calendar1 = calendar(1)

App.config({
    style: "./style/style.css",
    windows: [
      Bar(0, () => calendar0.visible = !calendar0.visible),
      Bar(1, () => calendar1.visible = !calendar1.visible),
			NotificationPopups(0),
			NotificationPopups(1),
			calendar0,
			calendar1,
    ],
})

export { }
