{ ... }:
{
  users = {
    users.media = {
      isSystemUser = true;
      uid = 5000;
      group = "media";
      extraGroups = [
        "video"
        "render"
      ];
    };
    groups.media.gid = 5000;
  };

  systemd.tmpfiles.rules = [
    "Z /media 0774 media media - -"
    "Z /downloads 0774 media media - -"
  ];
}
