{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nautilus
    loupe
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "foot";
  };

  services = {
    gvfs.enable = true;
    tumbler.enable = true;
    udisks2 = {
      enable = true;
      mountOnMedia = true;
    };
  };
}
