{pkgs, ...}: let
  username = "psoewish";
in {
  # Primary user setup
  users.groups.${username} = {};
  users.users.${username} = {
    group = username;
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIh/C3Qmm+9EoNeiLUNsmpvqzGjNF6n0xNUpksIm3xUK"
    ];
  };

  # Media service user setup
  users.groups.media = {gid = 5000;};
  users.users.psoewish.extraGroups = ["media"];
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
}
