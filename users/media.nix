{
  flake.modules.generic.media = {
    users.groups.media = {gid = 5000;};
    systemd.tmpfiles.settings.updateMedia = {
      "/data/media".Z = {
        user = "media";
        group = "media";
        mode = "0774";
      };
      "/data/downloads".Z = {
        user = "media";
        group = "media";
        mode = "0774";
      };
    };
  };
}
