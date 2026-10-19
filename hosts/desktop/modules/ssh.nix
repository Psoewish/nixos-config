{meta, ...}: {
  services = {
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "prohibit-password";
      };
    };
    fail2ban.enable = true;
  };

  programs.ssh.extraConfig = ''
    Host homelab
      Hostname 192.168.1.100
      Port 22
      User ${meta.primaryUser}
  '';
}
