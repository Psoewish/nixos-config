{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.services.fileflows;
  fileflows = pkgs.callPackage ../../../pkgs/fileflows.nix { };
in
{
  options.services.fileflows = {
    enable = mkEnableOption "FileFlows media processing service";

    port = mkOption {
      type = types.port;
      default = 19200;
      description = "Port FileFlows listens on";
    };

    dataDir = mkOption {
      type = types.str;
      default = "/var/lib/fileflows";
      description = "Directory for FileFlows state/logs/config";
    };

    user = mkOption {
      type = types.str;
      default = "fileflows";
      description = "User to run FileFlows as";
    };

    group = mkOption {
      type = types.str;
      default = "fileflows";
      description = "Group to run FileFlows as";
    };
  };

  config = mkIf cfg.enable {
    users.users.${cfg.user} = {
      isSystemUser = true;
      group = cfg.group;
      home = cfg.dataDir;
      extraGroups = [
        "render"
        "video"
      ];
    };

    users.groups.${cfg.group} = { };

    systemd.services.fileflows = {
      description = "FileFlows Media Processing Service";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];

      preStart = "${pkgs.writeShellScript "fileflows-setup" ''
        current_source="${fileflows}"
        version_file="${cfg.dataDir}/.source_path"

        if [ ! -f "$version_file" ] || [ "$(cat "$version_file")" != "$current_source" ]; then
          for component in Server FlowRunner Node; do
            ${pkgs.coreutils}/bin/rm -rf ${cfg.dataDir}/$component
            ${pkgs.coreutils}/bin/cp -r "${fileflows}/$component" ${cfg.dataDir}/
            ${pkgs.coreutils}/bin/chmod -R u+w ${cfg.dataDir}/$component
          done
        fi
      ''}";

      serviceConfig = {
        Type = "simple";
        User = cfg.user;
        Group = cfg.group;
        StateDirectory = "fileflows";

        DeviceAllow = [
          "/dev/dri/card1 rw"
          "/dev/dri/renderD128 rw"
        ];

        BindReadOnlyPaths = [
          "${pkgs.ffmpeg}/bin/ffmpeg:/usr/local/bin/ffmpeg"
          "${pkgs.ffmpeg}/bin/ffprobe:/usr/local/bin/ffprobe"
        ];

        Environment = [
          "PATH=${
            lib.makeBinPath [
              pkgs.dotnetCorePackages.sdk_8_0
              pkgs.ffmpeg
            ]
          }"
          "LD_LIBRARY_PATH=${
            lib.makeLibraryPath [
              pkgs.sqlite
              pkgs.zlib
            ]
          }"
          "DOTNET_ROOT=${pkgs.dotnetCorePackages.sdk_8_0}"
        ];

        ExecStart = pkgs.writeShellScript "fileflows-start" ''
          cd ${cfg.dataDir}/Server
          exec ${pkgs.dotnetCorePackages.sdk_8_0}/bin/dotnet ${cfg.dataDir}/Server/FileFlows.Server.dll --base-dir ${cfg.dataDir} --urls http://[::]:${toString cfg.port};
        '';

        Restart = "on-failure";
        RestartSec = 10;

        ReadWritePaths = [
          "${cfg.dataDir}"
          "/run"
          "/tmp"
        ];

        StandardOutput = "journal";
        StandardError = "journal";
        SyslogIdentifier = "fileflows";
      };
    };
  };
}
