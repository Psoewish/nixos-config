{
  flake.modules.nixos.vial = { pkgs, ... }: {
    hardware.keyboard.qmk.enable = true;
    environment.systemPackages = [ pkgs.vial ];
  };
}
