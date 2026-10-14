local vars = require("vars")

hl.config({
    general = {
        layout = vars.layout,
        resize_on_border = true,
        extend_border_grab_area = true,
        allow_tearing = false,
    },
    misc = {
        vrr = 1,
        enable_swallow = true,
        mouse_move_enables_dpms = true,
        mouse_move_focuses_monitor = true,
        close_special_on_empty = true,
        middle_click_paste = false,
        on_focus_under_fullscreen = 1,
    },
    cursor = {
        no_hardware_cursors = false,
        no_break_fs_vrr = false,
        min_refresh_rate = 30,
        warp_on_change_workspace = 1,
        default_monitor = vars.monitors.primary.name,
        use_cpu_buffer = 1,
    },
    xwayland = {
        force_zero_scaling = true,
    },
    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },
})
