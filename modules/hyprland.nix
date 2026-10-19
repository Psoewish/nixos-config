{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  environment.systemPackages = with pkgs; [hyprshot];

  services = {
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
    udisks2 = {
      enable = true;
      mountOnMedia = true;
    };
  };

  security = {
    polkit.enable = true;
    pam.services.login.enableGnomeKeyring = true;
  };
}
