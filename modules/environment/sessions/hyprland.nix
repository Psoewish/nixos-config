{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprland.enable = true;

  services = {
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
    udisks2 = {
      enable = true;
      mountOnMedia = true;
    };
    power-profiles-daemon.enable = true;
  };

  security = {
    polkit.enable = true;
    pam.services.login.enableGnomeKeyring = true;
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard-rs
    wl-clip-persist
    cliphist
    hyprshot
    hyprcursor
    nautilus
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "ghostty";
  };

  hm.wayland.windowManager.hyprland = let
    # Launcher
    launcher = "noctalia msg panel-toggle launcher";

    # Default applications
    terminal = "ghostty";
    guiFileManager = "nautilus";
    browser = "helium";
    browser2 = "qutebrowser";

    # Screenshots
    capture-window = "hyprshot -m window --clipboard-only";
    capture-region = "hyprshot -m region --clipboard-only";
    capture-screen = "hyprshot -m active -m output --clipboard-only";

    # Hotkeys
    mod = "SUPER";
    shiftmod = "SUPER + SHIFT";
    ctrlmod = "SUPER+ CTRL";
  in {
    enable = true;
    configType = "lua";
    systemd.variables = ["--all"];
    extraConfig =
      /*
      lua
      */
      ''
        hl.monitor({ output = "DP-1", mode = "preferred", position = "0x1440", scale = 1 })
        hl.monitor({ output = "DP-2", mode = "preferred", position = "0x0", scale = 1 })

        hl.workspace_rule({ workspace = "name:main", monitor = "DP-1", default = true, persistent = true })
        hl.workspace_rule({ workspace = "name:dev", monitor = "DP-1", persistent = true })
        hl.workspace_rule({ workspace = "name:gaming", monitor = "DP-1", persistent = true })
        hl.workspace_rule({ workspace = "name:temp", monitor = "DP-1", persistent = true })
        hl.workspace_rule({ workspace = "name:secondary", monitor = "DP-2", default = true, persistent = true })

        hl.window_rule({ match = { class = "pear-desktop" }, monitor = "DP-2" })
        hl.window_rule({ match = { class = "vesktop" }, monitor = "DP-2" })

        hl.bind("${mod} + RETURN", hl.dsp.exec_cmd("${terminal}"))
        hl.bind("${mod} + E", hl.dsp.exec_cmd("${guiFileManager}"))
        hl.bind("${mod} + B", hl.dsp.exec_cmd("${browser}"))
        hl.bind("${shiftmod} + B", hl.dsp.exec_cmd("${browser2}"))
        hl.bind("${mod} + Slash", hl.dsp.exec_cmd("${launcher}"))

        hl.bind("PRINT", hl.dsp.exec_cmd("${capture-region}"))
        hl.bind("ALT + PRINT", hl.dsp.exec_cmd("${capture-window}"))
        hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("${capture-screen}"))
        hl.bind("${mod} + V", hl.dsp.window.float({ action = "toggle" }))
        hl.bind("${mod} + Q", hl.dsp.window.close())
        hl.bind("${mod} + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
        hl.bind("${shiftmod} + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

        hl.bind("${mod} + left", hl.dsp.focus({ direction = "left" }))
        hl.bind("${mod} + right", hl.dsp.focus({ direction = "right" }))
        hl.bind("${mod} + up", hl.dsp.focus({ direction = "up" }))
        hl.bind("${mod} + down", hl.dsp.focus({ direction = "down" }))

        hl.bind("${shiftmod} + left", hl.dsp.window.move({ direction = "left" }))
        hl.bind("${shiftmod} + right", hl.dsp.window.move({ direction = "right" }))
        hl.bind("${shiftmod} + up", hl.dsp.window.move({ direction = "up" }))
        hl.bind("${shiftmod} + down", hl.dsp.window.move({ direction = "down" }))

        hl.bind("${mod} + bracketleft", hl.dsp.layout( "addmaster" ))
        hl.bind("${mod} + bracketright", hl.dsp.layout( "removemaster" ))
        hl.bind("${shiftmod} + tab", hl.dsp.layout( "cyclenext" ))
        hl.bind("${mod} + tab", hl.dsp.layout( "cycleprev" ))

        hl.bind("${ctrlmod} + left", hl.dsp.window.resize({ x = -50, y = 0 }))
        hl.bind("${ctrlmod} + right", hl.dsp.window.resize({ x = 50, y = 0 }))
        hl.bind("${ctrlmod} + up", hl.dsp.window.resize({ x = 0, y = -50 }))
        hl.bind("${ctrlmod} + down", hl.dsp.window.resize({ x = 0, y =50 }))

        hl.bind("${mod} + 1", hl.dsp.focus({ workspace = 1 }))
        hl.bind("${mod} + 2", hl.dsp.focus({ workspace = 2 }))
        hl.bind("${mod} + 3", hl.dsp.focus({ workspace = 3 }))
        hl.bind("${mod} + 4", hl.dsp.focus({ workspace = 4 }))
        hl.bind("${mod} + 5", hl.dsp.focus({ workspace = 5 }))

        hl.bind("${shiftmod} + 1", hl.dsp.focus({ workspace = 1 }))
        hl.bind("${shiftmod} + 2", hl.dsp.focus({ workspace = 2 }))
        hl.bind("${shiftmod} + 3", hl.dsp.focus({ workspace = 3 }))
        hl.bind("${shiftmod} + 4", hl.dsp.focus({ workspace = 4 }))
        hl.bind("${shiftmod} + 5", hl.dsp.focus({ workspace = 5 }))

        hl.bind("${mod} + mouse:272", hl.dsp.window.drag())
        hl.bind("${mod} + mouse:273", hl.dsp.window.resize())

        hl.on("hyprland.start", function()
          hl.exec_cmd("noctalia")
          hl.exec_cmd("wl-paste --watch cliphist store")
          hl.exec_cmd("steam -silent")
          hl.exec_cmd("vesktop")
          hl.exec_cmd("pear-desktop")
          hl.exec_cmd("streamcontroller -b")
        end)

        hl.config({
          general = {
            border_size = 1,
            gaps_in = 5,
            gaps_out = 10,
            layout = "master",
            resize_on_border = true,
            extend_border_grab_area = true,
            allow_tearing = false,
          },
          decoration = {
            rounding = 10,
            rounding_power = 2,
            dim_inactive = false,
            shadow = {
              enabled = true,
              range = 4,
              render_power = 3,
              color = "rgba(1a1a1aee)",
            },
            blur = {
              enabled = true,
              size = 3,
              passes = 2,
              vibrancy = 0.1696,
            },
          },
          animations = {
            enabled = true,
          },

          misc = {
            vrr = 1,
            enable_swallow = true,
            mouse_move_enables_dpms = true,
            key_press_enables_dpms = true,
            mouse_move_focuses_monitor = true,
            close_special_on_empty = true,
            middle_click_paste = true,
            on_focus_under_fullscreen = 1,
          },

          cursor = {
            no_hardware_cursors = false,
            no_break_fs_vrr = false,
            min_refresh_rate = 30,
            warp_on_change_workspace = 1,
            default_monitor = "DP-1",
            use_cpu_buffer = 1,
          },

          xwayland = {
            force_zero_scaling = true,
          },

          ecosystem = {
            no_update_news = true,
            no_donation_nag = true,
          },

          master = {
            allow_small_split = true,
            special_scale_factor = 1,
            mfact = 0.5,
            new_status = "slave",
            new_on_top = false,
            new_on_active = "none",
            slave_count_for_center_master = 0,
          },
        })


        hl.curve("default", { type = "bezier", points = { {0.5, 1}, {0.89, 1} } })
        hl.animation({ leaf = "windows", enabled = false })
        hl.animation({ leaf = "global", enabled = false })
        hl.animation({ leaf = "fade", enabled = true, speed = 5, bezier = "default" })
        hl.animation({ leaf = "fadeIn", enabled = true, speed = 5, bezier = "default" })
        hl.animation({ leaf = "fadeOut", enabled = true, speed = 5, bezier = "default" })
        hl.animation({ leaf = "fadeDim", enabled = true, speed = 5, bezier = "default" })
      '';
  };
}
