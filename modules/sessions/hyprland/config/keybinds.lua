local vars = require("vars")

-- applications
hl.bind(vars.mod .. "RETURN", hl.dsp.exec_cmd(vars.launch .. vars.terminal))
hl.bind(vars.mod .. "B", hl.dsp.exec_cmd(vars.launch .. vars.browser))
hl.bind(vars.mod .. "SLASH", hl.dsp.exec_cmd(vars.launch .. vars.launcher))
hl.bind(vars.mod .. "E", hl.dsp.exec_cmd(vars.launch .. vars.filemanager))

-- screenshots
hl.bind("PRINT", hl.dsp.exec_cmd(vars.capture_region))
hl.bind(vars.alt .. "PRINT", hl.dsp.exec_cmd(vars.capture_window))
hl.bind(vars.shift .. "PRINT", hl.dsp.exec_cmd(vars.capture_screen))

-- window management
hl.bind(vars.mod .. "G", hl.dsp.window.float({ action = "toggle", }))
hl.bind(vars.mod .. "Q", hl.dsp.window.close())
hl.bind(vars.mod .. "F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle", }))
hl.bind(vars.mod .. vars.shift .. "F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle", }))
for _, dir in ipairs({ "LEFT", "DOWN", "UP", "RIGHT" }) do
    hl.bind(vars.mod .. dir, hl.dsp.focus({ direction = dir:lower() }))
    hl.bind(vars.mod .. vars.shift .. dir, hl.dsp.window.move({ direction = dir:lower() }))
end

-- add/remove master
hl.bind(vars.mod .. "BRACKETLEFT", hl.dsp.layout("addmaster"))
hl.bind(vars.mod .. "BRACKETRIGHT", hl.dsp.layout("removemaster"))

-- resize master
hl.bind(vars.mod .. vars.ctrl .. "RIGHT", hl.dsp.layout("mfact +0.05"))
hl.bind(vars.mod .. vars.ctrl .. "LEFT", hl.dsp.layout("mfact -0.05"))

-- workspace management
for i = 1, vars.monitors.primary.workspaces + vars.monitors.secondary.workspaces do
    local n = tostring(i % 10)

    hl.bind(vars.mod .. n, hl.dsp.focus({ workspace = i }))
    hl.bind(vars.mod .. vars.shift .. n, hl.dsp.window.move({ workspace = i }))
end

-- mouse actions
hl.bind(vars.mod .. "mouse:272", hl.dsp.window.drag())
hl.bind(vars.mod .. "mouse:273", hl.dsp.window.resize())
