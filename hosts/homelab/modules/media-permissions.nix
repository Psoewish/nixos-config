toplevel@{config,...}:{
  flake.modules.nixos.homelab = {
    users.groups.media = {gid = 5000;};
    users.users.${toplevel.config.flake.meta.primaryUser.username}.extraGroups = ["media"];
    users.users.media = {
      isSystemUser = true;
      uid = 5000;
      group = "media";
    };
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
