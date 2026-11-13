{
  den.aspects.dev.editors.helix.plugins.glyph = {
    homeManager = {
      pkgs,
      lib,
      ...
    }: {
      programs.helix.plugins = {inherit (pkgs.helixPlugins) glyph-hx;};

      xdg.configFile."helix/init.scm".text = lib.mkAfter ''
        (require "glyph/glyph.scm")
      '';
    };
  };
}
