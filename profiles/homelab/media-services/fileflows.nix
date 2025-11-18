{
  config,
  lib,
  pkgs,
  mkRoute,
  ...
}:

let
  cfg = config.services.fileflows;
  fileflows = pkgs.callPackage ../../../pkgs/fileflows.nix { };
in
{
  options.services.fileflows = {
    enable = lib.mkEnableOption "FileFlows file processing and transcoding automation";

    dataDir = lib.mkOption {
      type = lib.types.path;
      default = "/var/lib/fileflows";
      description = "Directory where FileFlows stores its data";
    };

    port = lib.mkOption {
      type = lib.types.port;
      default = 19200;
      description = "Port for the FileFlows web interface";
    };

    user = lib.mkOption {
      type = lib.types.str;
      default = "fileflows";
      description = "User account under which FileFlows runs";
    };

    group = lib.mkOption {
      type = lib.types.str;
      default = "fileflows";
      description = "Group under which FileFlows runs";
    };
  };

  config = lib.mkMerge [
    {
      services.fileflows.enable = true;
    }

    (lib.mkIf cfg.enable {
      nixpkgs.config.allowUnfreePredicate =
        pkg:
        builtins.elem (lib.getName pkg) [
          "fileflows"
        ];

      users.users.${cfg.user} = {
        isSystemUser = true;
        group = cfg.group;
        home = cfg.dataDir;
        createHome = true;
      };

      users.groups.${cfg.group} = { };

      systemd.services.fileflows = {
        description = "FileFlows file processing and transcoding automation";
        after = [ "network.target" ];
        wantedBy = [ "multi-user.target" ];

        environment = {
          DOTNET_ROOT = "${pkgs.dotnetCorePackages.sdk_8_0}";
          HOME = cfg.dataDir;
        };

        serviceConfig = {
          Type = "simple";
          User = cfg.user;
          Group = cfg.group;
          WorkingDirectory = "${fileflows}/lib/Server";
          ExecStart = "${fileflows}/bin/Server --base-dir ${cfg.dataDir} --urls http://[::]:${toString cfg.port}";
          Restart = "on-failure";
          RestartSec = "10s";

          NoNewPrivileges = true;
          PrivateTmp = true;
          ProtectSystem = "strict";
          ProtectHome = true;
          ReadWritePaths = [ cfg.dataDir ];
        };
      };
    })

    (lib.mkIf cfg.enable (mkRoute {
      service = "fileflows";
      subdomain = "fileflows";
      port = cfg.port;
      public = false;
    }))
  ];
}
