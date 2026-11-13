{
  den.aspects.dev.editors.helix.plugins.who = {
    homeManager = {
      pkgs,
      lib,
      ...
    }: {
      programs.helix.plugins = {inherit (pkgs.helixPlugins) who-hx;};

      xdg.configFile."helix/init.scm".text = lib.mkAfter ''
        (require "who/who.scm")
      '';
    };
  };
}
