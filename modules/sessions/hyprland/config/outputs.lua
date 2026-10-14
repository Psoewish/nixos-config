local vars = require("vars")

-- monitors
for _, monitor in pairs(vars.monitors) do
    hl.monitor({
        output = monitor.name,
        position = monitor.position,
        mode = "preferred",
        scale = 1,
    })
end

-- workspaces
for i = 1, vars.monitors.primary.workspaces + vars.monitors.secondary.workspaces do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = (i <= vars.monitors.primary.workspaces)
            and vars.monitors.primary.name
            or vars.monitors.secondary.name,
        default = (i == 1 or i == vars.monitors.primary.workspaces + 1),
        persistent = true,
    })
end
