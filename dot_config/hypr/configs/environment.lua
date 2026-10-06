-- configs/environment.lua
-- Environment variables

-- cursor
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Future-cyan-cursors")
hl.env("HYPRCURSOR_SIZE", "32")
hl.env("HYPRCURSOR_THEME", "Future-Cyan-Hyprcursor_Theme")

-- session
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")

-- editor
hl.env("EDITOR", "nvim")
hl.env("VISUAL", "nvim")
hl.env("SUDO_EDITOR", "nvim")

-- QT
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct:qt6ct")
