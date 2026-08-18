toplevel @ {config, ...}: {
  flake.modules.nixos.desktop = {lib, ...}: {
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

    programs.ssh.extraConfig = lib.concatStringsSep "\n" (lib.mapAttrsToList (hostname: host: ''
        Host ${host.hostname}
          Hostname ${host.staticIp}
          Port 22
          User ${toplevel.config.global.primaryUser}
      '')
      (lib.foldl' (acc: classHosts: acc // classHosts) {} (lib.attrValues toplevel.config.hosts)));
  };
}
