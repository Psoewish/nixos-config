{
  flake.modules.nixos.gnome = {
    inputs,
    pkgs,
    ...
  }: {
    imports = [inputs.self.modules.nixos.greeter];
    services.desktopManager.gnome.enable = true;

    environment.systemPackages = (
      with pkgs.gnomeExtensions; [
        caffeine
        appindicator
      ]
    );
  };
}
