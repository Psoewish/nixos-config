{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraEnv = {
        TZDIR = "/usr/share/zoneinfo";
      };
    };
    remotePlay.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    protontricks.enable = true;
  };

  environment.systemPackages = with pkgs; [
    heroic
    faugus-launcher
    satisfactorymodmanager
  ];
}
