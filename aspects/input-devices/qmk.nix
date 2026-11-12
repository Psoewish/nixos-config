{
  den.aspects.input-devices.gamesir = {
    nixos = {pkgs, ...}: {
      hardware.keyboard.qmk.enable = true;
      environment.systemPackages = [pkgs.vial];
    };
  };
}
