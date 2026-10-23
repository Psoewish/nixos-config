{
  inputs,
  lib,
  pkgs,
  ...
}: {
  # Best display manager in the world
  services.getty.autologinUser = "psoewish";
  environment.loginShellInit = toString (pkgs.writers.writeFish "start-mango" "test (tty) = /dev/tty1; and exec mango");

  # Import modules from inputs
  imports = with inputs; [
    mangowm.nixosModules.mango
    noctalia.nixosModules.default
  ];

  # Enable ManngoWM
  programs.mango.enable = true;

  # Enable Noctalia shell
  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
    systemd.enable = true;
  };

  # Add some extra packages
  fonts.packages = with pkgs; [
    maple-mono.NF-CN
    inter
  ];

  environment.systemPackages = with pkgs; [
    adw-gtk3
    bibata-cursors
    papirus-icon-theme
    nautilus
    loupe
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "foot";
  };

  # Link my dotfiles
  hjem.users.psoewish.xdg.config.files."mango/config.conf".source = lib.mkSymlink ./config/config.conf;
  hjem.users.psoewish.xdg.config.files."mango/autostart.conf".source = lib.mkSymlink ./config/autostart.conf;
  hjem.users.psoewish.xdg.config.files."mango/keybinds.conf".source = lib.mkSymlink ./config/keybinds.conf;
  hjem.users.psoewish.xdg.config.files."mango/rules.conf".source = lib.mkSymlink ./config/rules.conf;
}
