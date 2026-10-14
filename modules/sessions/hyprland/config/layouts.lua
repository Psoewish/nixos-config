-- master
hl.config({
    master = {
        allow_small_split = true,
        special_scale_factor = 1,
        mfact = 0.5,
        new_status = "slave",
        new_on_top = false,
        new_on_active = "none",
        orientation = "left",
        smart_resizing = false,
        drop_at_cursor = true,
        always_keep_position = false,
        focus_master_on_close = false,
    }
})

-- scrolling
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
        column_width = 0.5,
        focus_fit_method = 1,
        follow_focus = true,
        follow_min_visible = 0.4,
        explicit_column_widths = "0.333,0.5,0.667,1.0",
        wrap_focus = false,
        wrap_swapcol = false,
        direction = "right",
    }
})

-- dwindle
hl.config({
    dwindle = {
        force_split = 2,
        preserve_split = false,
        smart_split = false,
        smart_resizing = false,
        permanent_direction_override = false,
        special_scale_factor = 1,
        split_width_multiplier = 1.0,
        use_active_for_splits = true,
        default_split_ratio = 1.0,
        split_bias = 1,
        precise_mouse_move = true,
    }
})
