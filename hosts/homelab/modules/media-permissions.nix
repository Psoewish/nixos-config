toplevel@{config,...}:{
  flake.modules.nixos.homelab = {
    users.groups.media = {gid = 5000;};
    users.users.${toplevel.config.flake.metadata.primaryUser.username}.extraGroups = ["media"];
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
