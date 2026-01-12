{ ... }:
{
  users.groups.media.gid = 5000;
  users.users.media = {
    isSystemUser = true;
    uid = 5000;
    group = "media";
    extraGroups = [
      "video"
      "render"
    ];
  };
  systemd.tmpfiles.rules = [
    "Z /data/media 0775 root media - -"
  ];
}
