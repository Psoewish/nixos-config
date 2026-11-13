{
  den.aspects.dev.editors.helix.plugins.notify = {
    homeManager = {
      pkgs,
      lib,
      ...
    }: {
      programs.helix.plugins = {inherit (pkgs.helixPlugins) notify-hx;};

      xdg.configFile."helix/init.scm".text = lib.mkAfter ''
        (require "notify/notify.scm")
      '';
    };
  };
}
