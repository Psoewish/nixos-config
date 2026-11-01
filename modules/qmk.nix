{pkgs, ...}: {
  # Keyboard
  hardware.keyboard.qmk.enable = true;
  environment.systemPackages = [pkgs.vial];
}
