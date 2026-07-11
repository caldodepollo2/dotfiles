-- MONITORS 

hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@60",
    position = "0x0",
    scale = "1",
})

-- AUTOSTART 

hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/lib/xdg-desktop-portal-hyprland")
    hl.exec_cmd("rfkill unblock bluetooth")
    hl.exec_cmd("bluetoothctl power off")
    hl.exec_cmd("brightnessctl set 10%")
    hl.exec_cmd("fnott")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("sleep 2 && systemctl --user start hyprpolkitagent")
    hl.exec_cmd("sleep 2 && hyprlock")
end)

-- ENVIRONMENT VARIABLES 

hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Future-cyan-cursors")
hl.env("HYPRCURSOR_SIZE", "32")
hl.env("HYPRCURSOR_THEME", "Future-Cyan-Hyprcursor_Theme")
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
hl.env("QT_STYLE_OVERRIDE", "adwaita")
hl.env("WLR_RENDERER", "vulkan")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- LOOK AND FEEL 

hl.curve("lyoko_quick", { type = "bezier", points = { { 0.25, 0 }, { 0.2, 1 } } })
hl.curve("lyoko_scan", { type = "bezier", points = { { 0.5, 1 }, { 0.5, 0 } } })

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 3,
    bezier = "lyoko_quick",
    style = "popin",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 2,
    bezier = "lyoko_quick",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 2,
    bezier = "lyoko_quick",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 3,
    bezier = "lyoko_quick",
    style = "slide",
})

hl.config({
    general = {
        gaps_in = 8,
        gaps_out = 16,
        border_size = 3,
        col = {
            active_border = { 
                colors = { "rgba(00bfffdd)", "rgba(4da6ffdd)" }, 
                angle = 135 
            }, 
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

-- KEYBINDINGS 

-- Lanzadores
hl.bind("SUPER" .. " + Return", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER" .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind("SUPER" .. " + SHIFT + E", hl.dsp.exec_cmd("kitty -e yazi"))
hl.bind("SUPER" .. " + D", hl.dsp.exec_cmd("fuzzel"))
hl.bind("SUPER" .. " + B", hl.dsp.exec_cmd("librewolf"))
hl.bind("SUPER" .. " + Q", hl.dsp.window.close())
hl.bind("Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" ~/Pictures/Screenshot_$(date +%Y%m%d_%H%M%S).png"))
hl.bind("SUPER" .. " + P", hl.dsp.exec_cmd("~/.local/bin/fuzzel-power.sh"))
hl.bind("SUPER" .. " + S", hl.dsp.exec_cmd("~/.local/bin/fuzzel-search.sh"))
hl.bind("SUPER" .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER" .. " + V", hl.dsp.exec_cmd("cliphist list | fuzzel --dmenu --with-nth 2 | cliphist decode | wl-copy"))
hl.bind("SUPER" .. " + A", hl.dsp.exec_cmd("hyprpicker -a -f hex"))

-- Movimiento
hl.bind("SUPER" .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER" .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER" .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER" .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER" .. " + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER" .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER" .. " + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER" .. " + SHIFT + down", hl.dsp.window.move({ direction = "d" }))

hl.bind("SUPER" .. " + CTRL + left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER" .. " + CTRL + right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER" .. " + CTRL + up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind("SUPER" .. " + CTRL + down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

hl.bind("SUPER" .. " + Tab", hl.dsp.window.cycle_next({ next = true }))
hl.bind("SUPER" .. " + SHIFT + Tab", hl.dsp.window.cycle_next({ prev = true }))

hl.bind("SUPER" .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER" .. " + Space", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- Workspaces
hl.bind("SUPER" .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER" .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER" .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER" .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER" .. " + 5", hl.dsp.focus({ workspace = 5 }))

hl.bind("SUPER" .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER" .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER" .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER" .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER" .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))

-- Mouse
hl.bind("SUPER" .. " + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER" .. " + mouse:273", hl.dsp.window.resize())

-- Controles sistema
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"))

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"))

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))