{
  flake.modules.nixos.core = {
    lib,
    config,
    hosts,
    ...
  }: {
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
          User ${config.constants.primaryUser}
      '')
      hosts.nixos);

    users.users.${config.constants.primaryUser}.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIh/C3Qmm+9EoNeiLUNsmpvqzGjNF6n0xNUpksIm3xUK psoewish"
    ];
  };
}
