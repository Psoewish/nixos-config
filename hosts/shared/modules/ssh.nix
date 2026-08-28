toplevel @ {
  inputs,
  lib,
  config,
  ...
}: {
  flake.modules.nixos.shared = {
    services = {
      openssh = {
        enable = true;
        settings = {
          PasswordAuthentication = false;
          KbdInteractiveAuthentication = false;
          PermitRootLogin = "no";
        };
      };
      fail2ban.enable = true;
    };

    programs.ssh.extraConfig = lib.concatStringsSep "\n" (lib.mapAttrsToList (hostname: hostdata: ''
        Host ${hostname}
          Hostname ${hostdata.staticIp}
          Port 22
          User ${toplevel.config.flake.metadata.primaryUser.username}
      '')
      toplevel.config.flake.hosts.nixos);

    users.users.${toplevel.config.flake.metadata.primaryUser.username}.openssh.authorizedKeys.keyFiles = [
      (inputs.self.outPath + "/hosts/shared/secrets/personal_ssh.pub")
    ];
  };
}
