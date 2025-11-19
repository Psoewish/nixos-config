{
  lib,
  pkgs,
  mkRoute,
  ...
}:
let
  tdarr-server = pkgs.callPackage ../../../pkgs/tdarr-server.nix { };
  tdarr-node = pkgs.callPackage ../../../pkgs/tdarr-node.nix { };
in
lib.mkMerge [
  {
    users.users = {
      tdarr-server = {
        isSystemUser = true;
        group = "tdarr-server";
        home = "/var/lib/tdarr-server";
        createHome = true;
      };
      tdarr-node = {
        isSystemUser = true;
        group = "tdarr-node";
        home = "/var/lib/tdarr-node";
        createHome = true;
      };
    };

    users.groups.tdarr-server = { };
    users.groups.tdarr-node = { };

    systemd.tmpfiles.rules = [
      "d /var/lib/tdarr-server 0755 tdarr-server tdarr-server -"
      "d /var/lib/tdarr-server/configs 0755 tdarr-server tdarr-server -"
      "d /var/lib/tdarr-server/server 0755 tdarr-server tdarr-server -"
      "d /var/lib/tdarr-server/logs 0755 tdarr-server tdarr-server -"
      "d /var/lib/tdarr-node 0755 tdarr-node tdarr-node -"
      "d /var/lib/tdarr-node/configs 0755 tdarr-node tdarr-node -"
      "d /var/lib/tdarr-node/node 0755 tdarr-node tdarr-node -"
      "d /var/lib/tdarr-node/logs 0755 tdarr-node tdarr-node -"
    ];

    systemd.services = {
      tdarr-server = {
        description = "Tdarr Server";
        after = [ "network.target" ];
        wantedBy = [ "multi-user.target" ];

        environment = {
          serverIP = "0.0.0.0";
          serverPort = "8266";
          webUIPort = "8265";
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

          # Bind writable paths over the nix store locations
          BindPaths = [
            "/var/lib/tdarr-server/configs:${tdarr-server}/lib/configs"
            "/var/lib/tdarr-server/server:${tdarr-server}/lib/server"
            "/var/lib/tdarr-server/logs:${tdarr-server}/lib/logs"
          ];
        };
      };
      tdarr-node = {
        description = "Tdarr Node";
        after = [ "network.target" ];
        wantedBy = [ "multi-user.target" ];

        environment = {
          serverURL = "http://0.0.0.0:8266";
          nodeType = "mapped";
        };

        serviceConfig = {
          Type = "simple";
          User = "tdarr-node";
          Group = "tdarr-node";
          ExecStart = "${tdarr-node}/bin/tdarr-node";
          WorkingDirectory = "/var/lib/tdarr-node";
          Restart = "on-failure";
          RestartSec = 5;

          # Hardening
          NoNewPrivileges = true;
          PrivateTmp = true;

          # Bind writable paths over the nix store locations
          BindPaths = [
            "/var/lib/tdarr-node/configs:${tdarr-node}/lib/configs"
            "/var/lib/tdarr-node/node:${tdarr-node}/lib/node"
            "/var/lib/tdarr-node/logs:${tdarr-node}/lib/logs"
          ];
        };
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
