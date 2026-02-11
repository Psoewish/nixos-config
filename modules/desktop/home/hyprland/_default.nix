{ ... }:
let
  launch = "uwsm app -- ";
  terminal = "ghostty +new-window";
  launcher = "fuzzel";
  guiFileManager = "nautilus --new-window";
  browser = "qutebrowser";
  browser2 = "zen";
  screenshot = "grimblast --notify";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [ "--all" ];
    settings = {
      exec-once = [
        "${launch} steam -silent"
        "${launch} vesktop"
        "${launch} ytmdesktop"
        "${launch} wl-paste --watch cliphist store &"
        "systemctl enable --user app-com.mitchellh.ghostty.service"
        "${launch} noctalia-shell"
      ];
      monitor = [
        "DP-1, preferred, 0x1440, auto"
        "DP-2, preferred, 0x0, auto"
      ];

      workspace = [
        "1, monitor:DP-1, default:true, persistent:true"
        "2, monitor:DP-1, persistent:true"
        "3, monitor:DP-1, persistent:true"
        "4, monitor:DP-1, persistent:true"
        "5, monitor:DP-2, default:true, persistent:true"
      ];

      windowrule = [
        "match:class Youtube Music Desktop App, monitor 1"
        "match:class vesktop, monitor 1"
      ];

      layerrule = [
        {
          name = "noctalia";
          "match:namespace" = "noctalia-background-.*$";
          ignore_alpha = 0.5;
          blur = true;
          blur_popups = true;
        }
      ];

      "$mod" = "SUPER";
      "$shiftmod" = "SUPERSHIFT";
      "$ctrlmod" = "SUPERCTRL";

      bind = [
        "$mod, RETURN, exec, ${launch} ${terminal}"
        "$mod, E, exec, ${launch} ${guiFileManager}"
        "$mod, B, exec, ${launch} ${browser}"
        "$shiftmod, B, exec, ${launch} ${browser2}"

        "$mod, Slash, exec, ${launch} ${launcher}"

        ", PRINT, exec, ${screenshot} --freeze copysave area"
        "SHIFT, PRINT, exec, ${screenshot} copysave output"

        "$mod, V, togglefloating"
        "$mod, Q, killactive"
        "$mod, F, fullscreenstate, 1 3"
        "$shiftmod, F, fullscreenstate, 3 3"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$shiftmod, left, movewindow, l"
        "$shiftmod, right, movewindow, r"
        "$shiftmod, up, movewindow, u"
        "$shiftmod, down, movewindow, d"

        "$mod, bracketleft, layoutmsg, addmaster"
        "$mod, bracketright, layoutmsg, removemaster"
        "$shiftmod, tab, layoutmsg, cyclenext"
        "$mod, tab, layoutmsg, cycleprev"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"

        "$shiftmod, 1, movetoworkspace, 1"
        "$shiftmod, 2, movetoworkspace, 2"
        "$shiftmod, 3, movetoworkspace, 3"
        "$shiftmod, 4, movetoworkspace, 4"
        "$shiftmod, 5, movetoworkspace, 5"

        "$ctrlmod, left, resizeactive, -50 0"
        "$ctrlmod, right, resizeactive, 50 0"
        "$ctrlmod, up, resizeactive, 0 -50"
        "$ctrlmod, down, resizeactive, 0 50"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
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

      source = "./noctalia/noctalia-colors.conf";
      decoration = {
        rounding = 10;
        rounding_power = 2;
        dim_inactive = false;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 2;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = false;
        animation = [
          "windows, 0"
          "global, 0"
          "fade, 1, 5, default"
          "fadeIn, 1, 5, default"
          "fadeOut, 1, 5, default"
          "fadeDim, 1, 5, default"
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
        on_focus_under_fullscreen = 1;
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
        slave_count_for_center_master = 0;
      };
    };
  };

  services.hyprpolkitagent.enable = true;
}
