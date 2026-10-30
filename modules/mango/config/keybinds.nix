{
  home.config = {
    wayland.windowManager.mango.settings = let
      mod = "SUPER";
      terminal = "foot";
      browser = "helium";
    in {
      bind = [
        "${mod},B,spawn,${browser}"
        "${mod},RETURN,spawn,${terminal}"
        "${mod},SLASH,spawn,noctalia msg panel-toggle launcher"

        "none,PRINT,spawn,screenshot --region"
        "ALT,PRINT,spawn,screenshot --region --annotate"
        "CTRL,PRINT,spawn,screenshot --window"
        "ALT+CTRL,PRINT,spawn,screenshot --window --annotate"
        "SHIFT,PRINT,spawn,screenshot --output_focused"
        "ALT+SHIFT,PRINT,spawn,screenshot --output_focused --annotate"
        "CTRL+SHIFT,PRINT,spawn,screenshot --output_all"
        "ALT+CTRL+SHIFT,PRINT,spawn,screenshot --output_all --annotate"

        "${mod}+SHIFT,R,reload_config"

        "${mod},TAB,overcircle,next"
        "${mod}+SHIFT,TAB,overcircle,prev"

        "${mod},Q,killclient"
        "${mod},G,togglefloating"
        "${mod},F,togglemaximizescreen"
        "${mod}+SHIFT,F,togglefullscreen"

        "${mod},LEFT,focusdir,left"
        "${mod},DOWN,focusdir,down"
        "${mod},UP,focusdir,up"
        "${mod},RIGHT,focusdir,right"

        "${mod}+SHIFT,LEFT,exchange_client,left"
        "${mod}+SHIFT,DOWN,exchange_client,down"
        "${mod}+SHIFT,UP,exchange_client,up"
        "${mod}+SHIFT,RIGHT,exchange_client,right"

        "${mod},1,viewcrossmon,1,DP-1"
        "${mod},2,viewcrossmon,2,DP-1"
        "${mod},3,viewcrossmon,3,DP-1"
        "${mod},4,viewcrossmon,4,DP-1"
        "${mod},5,viewcrossmon,1,DP-2"

        "${mod}+SHIFT,1,tagcrossmon,1,DP-1"
        "${mod}+SHIFT,2,tagcrossmon,2,DP-1"
        "${mod}+SHIFT,3,tagcrossmon,3,DP-1"
        "${mod}+SHIFT,4,tagcrossmon,4,DP-1"
        "${mod}+SHIFT,5,tagcrossmon,1,DP-2"

        "${mod}+CTRL,1,toggleview,1,0"
        "${mod}+CTRL,2,toggleview,2,0"
        "${mod}+CTRL,3,toggleview,3,0"
        "${mod}+CTRL,4,toggleview,4,0"

        "${mod}+SHIFT,return,toggle_named_scratchpad,foot-scratch,none,foot --app-id foot-scratch"
        "${mod}+SHIFT,ESCAPE,toggle_named_scratchpad,btop-scratch,none,foot --app-id btop-scratch btop"
      ];

      mousebind = [
        "${mod},btn_left,moveresize,curmove"
        "${mod},btn_right,moveresize,curresize"
      ];
    };
  };
}
