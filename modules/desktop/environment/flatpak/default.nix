{ username, pkgs, ... }:
{
  users.users.${username}.packages = with pkgs; [
    flatpak
    bazaar
  ];

  services.flatpak = {
    enable = true;
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      "cosmic" = "https://apt.pop-os.org/cosmic/cosmic.flatpakrepo";
    };
  };
}
