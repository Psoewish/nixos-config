{
  flake.modules.nixos.obs = {
    programs.obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
  };
}
