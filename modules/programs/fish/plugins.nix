{
  flake.modules.homeManager.fish = { pkgs, ... }: {
    programs.fish.plugins =
      map
        (plugin: {
          name = plugin;
          src = pkgs.fishPlugins.${plugin}.src;
        })
        [
          "autopair"
          "done"
          "puffer"
          "tide"
          "sponge"
          "plugin-sudope"
        ];
  };
}
