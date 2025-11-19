{
  inputs,
  pkgs,
  username,
  ...
}:
{
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  home-manager.users.${username} =
    { pkgs, ... }:
    let
      terminal = "uwsm app -- foot";
      launcher = "uwsm app -- fuzzel";
      fileManager = "uwsm app -- nautilus --new-window";
      browser = "uwsm app -- zen";
      screenshot = "uwsm app -- grimblast --notify";
    in
    {
      wayland.windowManager.hyprland = {
        enable = true;
        systemd.variables = [ "--all" ];
        package = null;
        portalPackage = null;
        settings = {
          exec-once = [
            "uwsm app -- steam -silent"
            "uwsm app -- vesktop"
            "uwsm app -- spotify"
            "uwsm app -- wl-paste --watch cliphist store &"
            "uwsm app -- noctalia-shell -d"
          ];
          monitor = [
            "DP-1, preferred, auto, auto"
            "DP-2, preferred, auto-up, auto"
          ];

          workspace = [
            "1, monitor:DP-1, default:true, persistent:true"
            "2, monitor:DP-1, persistent:true"
            "3, monitor:DP-1, persistent:true"
            "4, monitor:DP-1, persistent:true"
            "5, monitor:DP-2, default:true, persistent:true"

            "special:scratch.term, on-created-empty:${terminal}"
            "special:scratch.mixer, on-created-empty:${terminal} -e pulsemixer"
            "special:scratch.files, on-created-empty:${fileManager}"
          ];

          windowrule = [
            "monitor 0, float, center, size 75%, class:steam"
            "monidor 0, float, center, size 50%, onworkspace:s[true]"

            "monitor 1', class:vesktop"
            "monitor 1', class:discord"
            "monitor 1', class:spotify"
          ];
          bind =
            let
              mod = "SUPER";
              shiftmod = "SUPER SHIFT";
              ctrlmod = "SUPER CTRL";
            in
            [
              "${mod}, RETURN, exec, ${terminal}"
              "${mod}, E, exec, ${fileManager}"
              "${mod}, B, exec, ${browser}"
              "${mod}, Slash, exec, ${launcher}"
              "${shiftmod}, RETURN, togglespecialworkspace, scratch.term"
              "${shiftmod}, P, togglespecialworkspace, scratch.mixer"
              "${shiftmod}, E, togglespecialworkspace, scratch.files"

              ", PRINT, exec, ${screenshot} --freeze copysave area"
              "SHIFT, PRINT, exec, ${screenshot} copysave output"

              "${mod}, V, togglefloating"
              "${mod}, Q, killactive"
              "${mod}, F, fullscreenstate, 1 3"
              "${shiftmod}, F, fullscreenstate, 3 3"

              "${mod}, left, movefocus, l"
              "${mod}, right, movefocus, r"
              "${mod}, up, movefocus, u"
              "${mod}, down, movefocus, d"

              "${shiftmod}, left, movewindow, l"
              "${shiftmod}, right, movewindow, r"
              "${shiftmod}, up, movewindow, u"
              "${shiftmod}, down, movewindow, d"

              "${mod}, bracketleft, layoutmsg, addmaster"
              "${mod}, bracketright, layoutmsg, removemaster"

              "${mod}, 1, workspace, 1"
              "${mod}, 2, workspace, 2"
              "${mod}, 3, workspace, 3"
              "${mod}, 4, workspace, 4"
              "${mod}, 5, workspace, 5"

              "${shiftmod}, 1, movetoworkspace, 1"
              "${shiftmod}, 2, movetoworkspace, 2"
              "${shiftmod}, 3, movetoworkspace, 3"
              "${shiftmod}, 4, movetoworkspace, 4"
              "${shiftmod}, 5, movetoworkspace, 5"

              "${ctrlmod}, left, resizeactive, -50 0"
              "${ctrlmod}, right, resizeactive, 50 0"
              "${ctrlmod}, up, resizeactive, 0 -50"
              "${ctrlmod}, down, resizeactive, 0 50"
            ];

          bindm =
            let
              mod = "SUPER";
            in
            [
              "${mod}, mouse:272, movewindow"
              "${mod}, mouse:273, resizewindow"
            ];
          general = {
            border_size = 1;
            gaps_in = 5;
            gaps_out = 10;
            layout = "master";
            resize_on_border = true;
            extend_border_grab_area = true;
            allow_tearing = false;
          };

          decoration = {
            rounding = 8;
            dim_inactive = false;
          };

          animations = {
            enabled = true;
            animation = [
              "windows, 1, 1, default, popin"
              "workspaces, 1, 5, default, fade"
              "layers, 1, 5, default, fade"
            ];
          };

          misc = {
            vrr = 1;
            enable_swallow = true;
            mouse_move_enables_dpms = true;
            key_press_enables_dpms = true;
            mouse_move_focuses_monitor = true;
            close_special_on_empty = true;
            middle_click_paste = true;
          };

          cursor = {
            no_hardware_cursors = false;
            no_break_fs_vrr = false;
            min_refresh_rate = 30;
            warp_on_change_workspace = 1;
            default_monitor = "DP-1";
            use_cpu_buffer = 1;
          };

          xwayland = {
            force_zero_scaling = true;
          };

          ecosystem = {
            no_update_news = true;
            no_donation_nag = true;
          };

          master = {
            allow_small_split = true;
            special_scale_factor = 1;
            mfact = 0.5;
            new_status = "slave";
            new_on_top = false;
            new_on_active = "none";
            inherit_fullscreen = false;
            slave_count_for_center_master = 0;
          };
        };
      };

      services.dunst.enable = true;
      services.hyprpolkitagent.enable = true;

      home.packages = with pkgs; [
        grimblast
        wl-clipboard
        wl-clip-persist
        cliphist
        hyprcursor
      ];
    };
}
