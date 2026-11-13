{
  den.aspects.dev.editors.helix.plugins.emotional = {
    homeManager = {
      pkgs,
      lib,
      ...
    }: {
      programs.helix.plugins = {inherit (pkgs.helixPlugins) emotional-hx;};

      xdg.configFile."helix/init.scm".text = lib.mkAfter ''
        (require (only-in "emotional.hx/emotional.scm"
          move_lines_up
          move_lines_down)
        )
      '';
    };
  };
}
