local vars = require("vars")

-- second monitor content
hl.window_rule({
    match = { class = "com.github.th-ch.youtube-music" },
    monitor = vars.monitors.secondary.name,
})
hl.window_rule({
    match = { class = "vesktop" },
    monitor = vars.monitors.secondary.name,
})
