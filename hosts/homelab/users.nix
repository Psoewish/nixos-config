{ username, pkgs, ... }:
{
  users = {
    users = {
      root.shell = pkgs.fish;
      ${username} = {
        shell = pkgs.fish;
        isNormalUser = true;
        description = username;
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
      };
      media = {
        isSystemUser = true;
        uid = 5000;
        group = "media";
        extraGroups = [
          "video"
          "render"
        ];
      };
    };
    groups.media.gid = 5000;
  };

  nix.settings.trusted-users = [ "root" ];

  systemd.tmpfiles.rules = [
    "Z /media 0774 media media - -"
    "Z /downloads 0774 media media - -"
  ];
}
