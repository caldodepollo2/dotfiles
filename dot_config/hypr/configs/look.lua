-- configs/look.lua
-- Look and feel (general, decoration, animations, etc.)

-- Animations (must be defined before the main config block)
hl.curve("quick", { type = "bezier", points = { { 0.25, 0 }, { 0.2, 1 } } })
hl.curve("scan", { type = "bezier", points = { { 0.5, 1 }, { 0.5, 0 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "quick", style = "popin" })
hl.animation({ leaf = "border", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "fade", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "quick", style = "slide" })

hl.config({
    general = {
        gaps_in = 8,
        gaps_out = 16,
        border_size = 3,
        col = {
            active_border = { colors = { "rgba(00bfffdd)", "rgba(4da6ffdd)" }, angle = 135 },
            inactive_border = "rgba(0a1428ff)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 10,
        active_opacity = 0.96,
        inactive_opacity = 0.85,
        shadow = {
            enabled = true,
            range = 12,
            render_power = 3,
            color = "rgba(001a33aa)",
        },
        blur = {
            enabled = true,
            size = 4,
            passes = 2,
            vibrancy = 0.25,
            special = true,
            popups = true,
        },
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = false,
        special_scale_factor = 0.95,
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
        animate_manual_resizes = false,
        enable_swallow = true,
    },
    input = {
        kb_layout = "es",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
            disable_while_typing = true,
        },
    },
})
