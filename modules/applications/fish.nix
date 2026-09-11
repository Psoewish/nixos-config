{
  flake.modules.nixos.fish = {pkgs, ...}: {
    programs.fish = {
      enable = true;
      useBabelfish = true;
    };
    environment.systemPackages = with pkgs.fishPlugins; [
      autopair
      done
      puffer
      sponge
      plugin-sudope
      pure
    ];
  };
}
