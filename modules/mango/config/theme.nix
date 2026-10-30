{config, ...}: let
  theme = config.stylix.base16Scheme.palette;
  rgb = hex: "0x${builtins.substring 1 6 hex}ff";
  rgba = hex: alpha: "0x${builtins.substring 1 6 hex}${alpha}";
in {
  home.config = {
    wayland.windowManager.mango.settings = {
      # base colors
      root_color = rgb theme.base00; # background
      border_color = rgb theme.base03; # inactive window
      focus_color = rgb theme.base0D; # active window
      drop_color = rgba theme.base00 "99"; # drop shadow
      urgent_color = rgb theme.base08; # urgent window
      shadows_color = rgba theme.base00 "99"; # shadows

      # state colors
      maximized_screen_color = rgb theme.base0B; # maximized window
      scratchpad_color = rgb theme.base0D; # scratchpad
      global_color = rgb theme.base08; # pinned windows
      overlay_color = rgb theme.base0C; # not sure what this one is lmao

      title_message_bar_height = 0;
      drag_corner = 4;
      focus_cross_monitor = 1;
      border_px = 1;
      border_radius = 0;
      gap_inner_horizontal = 5;
      gap_inner_vertical = 5;
      gap_outer_horizontal = 5;
      gap_outer_vertical = 5;

      animations = 1;

      blur = 1;
      blur_layer = 0;
      blur_optimized = 1;
      blur_params_num_passes = 2;
      blur_params_radius = 5;
      blur_params_noise = 0.02;
      blur_params_brightness = 0.9;
      blur_params_contrast = 0.9;
      blur_params_saturation = 1.0;
      layer_animations = 0;

      shadows = 1;
      layer_shadows = 0;
      shadow_only_floating = 0;
      shadows_size = 4;
      shadows_blur = 12;
      shadows_position_x = 2;
      shadows_position_y = 2;
    };
  };
}
