{
  flake.modules.nixos.theme-base = { inputs, pkgs, ... }: {
    environment.systemPackages = with pkgs; [ numix-icon-theme-square ];
  };
}
