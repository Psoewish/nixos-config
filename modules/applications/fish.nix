{
  flake.modules.nixos.fish = {
    programs.fish = {
      enable = true;
      useBabelfish = true;
    };
  };
}
