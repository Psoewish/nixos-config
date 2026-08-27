{
  flake.modules.nixos.input-remapper = {
    services.input-remapper = {
      enable = true;
      enableUdevRules = true;
    };
  };
}
