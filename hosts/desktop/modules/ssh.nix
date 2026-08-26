{
  flake.modules.nixos.desktop = {
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

    programs.ssh.extraConfig = ''
      Host homelab
        Hostname 192.168.1.100
        Port 22
        User psoewish
    '';
  };
}
