{ username, inputs, ... }:
{
  imports = [ inputs.mango.nixosModules.mango ];
  programs.mango.enable = true;

  home-manager.users.${username} =
    { inputs, ... }:
    {
      imports = [ inputs.mango.hmModules.mango ];
      wayland.windowManager.mango = {
        enable = true;
        settings = ''
          blur=1
          blur_layer=1
          blur_optimized=1
          border_radius=0
          focused_opacity=0.9
          unfocused_opacity=0.9

          animations=0

          scroller_default_proportion=0.5
          edge_scroller_pointer_focus=1
          scroller_ignore_proportion_single=1
          scroller_default_proportion_single=1.0
          scroller_proportion_preset="0.5,1.0"

          new_is_master=0
          default_mfact=0.5
          default_nmaster=1
          smartgaps=0

          sloppyfocus=1
          warpcursor=1
          focus_cross_monitor=1
          exchange_cross_monitor=1
          drag_tile_to_tile=1

          gappih=10
          gappiv=10
          gappoh=20
          gappov=20
          borderpx=1

          monitorrule=DP-1,0.5,1,tile,0,1,0,0,2560,1440,144
          monitorrule=DP-2,0.5,1,tile,0,1,0,0,2560,1440,60
        '';
      };
    };
}
