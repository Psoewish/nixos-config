{ username, pkgs, ... }:
{
  users.users.${username}.packages = with pkgs; [
    flatpak
    bazaar
  ];

  services.flatpak = {
    enable = true;
  };
}
