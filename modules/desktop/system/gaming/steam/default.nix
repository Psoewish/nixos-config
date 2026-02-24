{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    package = pkgs.millennium-steam.override {
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
}
