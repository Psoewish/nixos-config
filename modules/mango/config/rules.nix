{
  home.config = {
    wayland.windowManager.mango.settings = {
      # Monitor rules
      monitor_rule = [
        "name:DP-2,x:0,y:0,scale:1" # secondary monitor (top)
        "name:DP-1,x:0,y:1440,scale:1,primary:1" # primary monitor (bottom)
      ];

      # Tag rules
      tag_num = 4;
      tag_rule = [
        "id:*,monitor_name:DP-2,layout_name:scroller" # secondary monitor (top)
        "id:*,monitor_name:DP-1,layout_name:fair" # primary monitor (bottom)
      ];

      window_rule = [
        "app_id:^(discord|sone)$,monitor:DP-2,tags:1"
        "app_id:^(steam_app_\d+)$,monitor:DP-1,tags:2"

        "is_named_scratchpad:1,app_id:foot-scratch"
        "is_named_scratchpad:1,app_id:btop-scratch"
      ];

      scratchpad_width_ratio = 0.5;
      scratchpad_height_ratio = 0.5;
    };
  };
}
