{ pkgs, ... }:
{
  services = {
    power-profiles-daemon.enable = true;
    upower.enable = true;
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard-rs
    wl-clip-persist
    cliphist
    hyprshot
    hyprcursor
  ];

}
