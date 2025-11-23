{
  config,
  lib,
  mkRoute,
  ...
}:
let
  fileflowsUser = "fileflows";
in
lib.mkMerge [
  {
    users.users.${fileflowsUser} = {
      isSystemUser = true;
      group = fileflowsUser;
      uid = 990;
      home = "/var/lib/fileflows";
      createHome = true;
    };

    users.groups.${fileflowsUser} = { };

    virtualisation.oci-containers.containers.fileflows = {
      image = "revenz/fileflows:latest";
      volumes = [
        "/var/lib/fileflows:/app/Data:Z"
        "/var/log/fileflows:/app/Logs:Z"
        "/tmp/fileflows:/temp:Z"
        "/data/media:/media:Z"
        "/var/run/podman/podman.sock:/var/run/docker.sock:ro,Z"
        "/dev/dri:/dev/dri:Z"
      ];
      user = "0:${toString config.users.groups.media.gid}";
      extraOptions = [
        "--network=host"
      ];
    };

    systemd.tmpfiles.rules = [
      "d /var/lib/fileflows 0775 ${fileflowsUser} media -"
      "Z /var/lib/fileflows - - - - -"
      "d /var/log/fileflows 0775 ${fileflowsUser} media -"
      "Z /var/log/fileflows - - - - -"
      "d /tmp/fileflows 0775 ${fileflowsUser} media -"
      "Z /tmp/fileflows - - - - -"
    ];
  }
  (mkRoute {
    service = "fileflows";
    subdomain = "fileflows";
    port = 5000;
    public = false;
  })
]
