toplevel @ {config, ...}: {
  flake.modules.nixos.core = {lib, ...}: {
    services = {
      openssh = {
        enable = true;
        settings = {
          PermitRootLogin = "prohibit-password";
          PasswordAuthentication = false;
          KbdInteractiveAuthentication = false;
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

    users.users.${toplevel.config.global.primaryUser}.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIh/C3Qmm+9EoNeiLUNsmpvqzGjNF6n0xNUpksIm3xUK psoewish"
    ];
  };
}
