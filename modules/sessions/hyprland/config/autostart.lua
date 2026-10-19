local vars = require("vars")

hl.on("hyprland.start", function()
    hl.exec_cmd(vars.launch .. "steam -silent")
    hl.exec_cmd(vars.launch .. "vesktop")
    hl.exec_cmd(vars.launch .. "pear-desktop")
    hl.exec_cmd(vars.launch .. "pipeweaver-daemon --background")
    hl.exec_cmd(vars.launch .. "streamcontroller -b")
end)
