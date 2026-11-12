{den, ...}: {
  den.aspects.common.ssh.nixos = {lib, ...}: {
    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "prohibit-password";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };
    services.fail2ban.enable = true;
    programs.ssh.extraConfig = lib.concatLines (
      lib.concatLists (lib.mapAttrsToList (_: hosts:
        lib.mapAttrsToList (
          name: host: ''
            Host ${name}
              Hostname ${host.networking.address}
              Port 22
              User psoewish
          ''
        )
        hosts)
      den.hosts)
    );
  };
}
