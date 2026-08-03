{
  flake.modules.nixos.plasma = {inputs, ...}: {
    imports = [inputs.self.modules.nixos.greeter];
    services.desktopManager.plasma6.enable = true;
  };
}
