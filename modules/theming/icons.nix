{
  flake.modules.nixos.theme-base = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [numix-icon-theme-square];
  };
}
