{inputs, ...}: {
  den.aspects.mango.noctalia = {
    nixos = {
      imports = [inputs.noctalia.nixosModules.default];
      programs.noctalia = {
        enable = true;
        recommendedServices.enable = true;
        systemd.enable = true;
      };
    };
    homeManager = {user, ...}: {
      imports = [inputs.noctalia.homeModules.default];
      programs.noctalia = {
        enable = true;
        settings = {
          theme.templates = {
            builtin_ids = ["mango"];
            community_ids = ["sone"];
          };
          audio.enable_sounds = false;
          bar.default = {
            background_opacity = 0.85;
            capsule_radius = 0;
            margin_edge = 5;
            margin_ends = 5;
            padding = 5;
            radius = 0;
            thickness = 28;
            start = ["workspaces" "btn"];
            center = ["clock"];
            end = ["privacy" "tray" "notifications" "control-center"];
            monitor.DP-2.enabled = false;
          };
          bluetooth = {
            connect_when_enabled = true;
            connection_notifications = true;
          };
          calendar.enabled = true;
          control_center = {
            hidden_tabs = ["audio" "monitor" "power" "network" "bluetooth"];
            sidebar = "full";
            sidebar_section = "full";
            shortcuts = [
              {type = "caffeine";}
              {type = "wallpaper";}
            ];
          };
          shell = {
            avatar_path = inputs.self.outPath + "/assets/avatar.png";
            circular_avatar = false;
            corner_radius_scale = 0.0;
            launch_apps_as_systemd_services = true;
            polkit_agent = true;
            screen_time_enabled = true;
            animation.enabled = false;
            launcher = {
              categories = false;
              compact = true;
              layout = "simple";
            };
            panel = {
              control_center_placement = "floating";
              open_near_click_control_center = true;
            };
            screenshot = {
              confirm_region = true;
              directory = "/home/${user.name}/Pictures/Screenshots";
            };
            window_switcher = {
              current_workspaces_only = true;
              show_all_outputs = false;
            };
          };
          desktop_widgets.enabled = false;
          location.auto_locate = true;
          lockscreen.enabled = false;
          widget.clock.anchor = true;
          widget.control-center.glyph = "settings";
          widget.notifications.hide_when_no_unread = true;
          widget.privacy.hide_inactive = true;
          widget.workspaces.labels_only_when_occupied = true;

          plugins.enabled = ["ezequiel/mango_layouts"];
          plugin_settings."ezequiel/mango_layouts" = {
            list_mode = true;
            panel_open_near_click = true;
            show_center_tile = false;
            show_dwindle = false;
            show_fair = false;
            show_grid = false;
            show_monocle = false;
            show_right_tile = false;
            show_vertical_deck = false;
            show_vertical_fair = false;
            show_vertical_grid = false;
            show_vertical_scroller = false;
            show_vertical_tile = false;
          };
          widget.btn = {type = "ezequiel/mango_layouts:btn";};
        };
      };
    };
  };
}
