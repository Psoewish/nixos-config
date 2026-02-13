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
    extraPackages = with pkgs; [
      adwsteamgtk
    ];
    protontricks.enable = true;
  };
}
