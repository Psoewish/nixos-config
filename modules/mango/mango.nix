{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = with inputs; [mangowm.nixosModules.mango];

  programs.mango.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # Add some extra packages
  fonts.packages = with pkgs; [
    maple-mono.NF-CN
    inter
  ];

  environment.systemPackages = with pkgs; [
    adw-gtk3
    bibata-cursors
    papirus-icon-theme
  ];
  home.config = {
    imports = [inputs.mangowm.hmModules.mango];
    wayland.windowManager.mango = {
      enable = true;
      extraConfig = lib.concatLines (map (file: "source=~/nixos-config/modules/mango/config/${file}") [
        "autostart.conf"
        "keybinds.conf"
        "settings.conf"
        "rules.conf"
      ]);
    };
  };
}
