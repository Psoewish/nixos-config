local vars = require("vars")

-- general
hl.config({
    decoration = {
        dim_inactive = false,
    }
})

-- decorations
hl.config({
    general = {
        border_size = 1,
        gaps_in = 5,
        gaps_out = 10,
    },
    decoration = {
        rounding = 0,
    },
})

-- animations
hl.animation({ leaf = "global", enabled = false, })

-- blur
hl.config({
    decoration = {
        blur = {
            enabled = true,
            size = 3,
            passes = 2,
            vibrancy = 0.1696,
        },
    },
})

-- shadows
hl.config({
    decoration = {
        shadow = {
            enabled = false,
        },
    },
})
