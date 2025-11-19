{
  lib,
  pkgs,
  mkRoute,
  ...
}:
let
  tdarr-server = pkgs.callPackage ../../../pkgs/tdarr-server.nix { };
in
lib.mkMerge [
  {
    users.users.tdarr-server = {
      isSystemUser = true;
      group = "tdarr-server";
      home = "/var/lib/tdarr-server";
      createHome = true;
    };

    users.groups.tdarr-server = { };

    systemd.tmpfiles.rules = [
      "d /var/lib/tdarr-server 0755 tdarr-server tdarr-server -"
      "d /var/lib/tdarr-server/server 0755 tdarr-server tdarr-server -"
      "d /var/lib/tdarr-server/configs 0755 tdarr-server tdarr-server -"
      "d /var/lib/tdarr-server/logs 0755 tdarr-server tdarr-server -"
      "d /var/lib/tdarr-server/cache 0755 tdarr-server tdarr-server -"
    ];

    systemd.services.tdarr-server = {
      description = "Tdarr Server";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];

      environment = {
        serverIP = "0.0.0.0";
        serverPort = "8266";
        webUIPort = "8265";
        internalNode = "true";
        inContainer = "false";
        ffmpegVersion = "6";
        nodeName = "InternalNode";
      };

      serviceConfig = {
        Type = "simple";
        User = "tdarr-server";
        Group = "tdarr-server";
        ExecStart = "${tdarr-server}/bin/tdarr-server";
        WorkingDirectory = "/var/lib/tdarr-server";
        Restart = "on-failure";
        RestartSec = 5;

        # Hardening
        NoNewPrivileges = true;
        PrivateTmp = true;
        ProtectSystem = "strict";
        ProtectHome = true;
        ReadWritePaths = [
          "/var/lib/tdarr-server"
          "/data/media"
        ];
      };
    };
  }
  (mkRoute {
    service = "tdarr-server";
    subdomain = "tdarr";
    port = 8265;
    public = false;
  })
]
