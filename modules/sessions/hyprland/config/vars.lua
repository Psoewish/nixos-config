return {
  -- default layout
  layout = "master",

  -- modifier keys
  mod = "SUPER+",
  alt = "ALT+",
  shift = "SHIFT+",
  ctrl = "CTRL+",

  -- default applications
  launch = "uwsm app -- ",
  terminal = "foot",
  browser = "helium",
  launcher = "fuzzel",
  filemanager = "nautilus",

  -- screenshot tool
  capture_region = "hyprshot -m region --clipboard-only",
  capture_window = "hyprshot -m window --clipboard-only",
  capture_screen = "hyprshot -m active -m output --clipboard-only",

  -- monitor configuration
  monitors = {
    primary = {
      name = "DP-1",
      position = "0x1440",
      workspaces = 4,
    },
    secondary = {
      name = "DP-2",
      position = "0x0",
      workspaces = 1,
    },
  }
}
