{ ... }:
let
  username = "psoewish";
in
{
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

  programs.ssh.extraConfig = ''
    Host desktop
      Hostname 192.168.1.16
      Port 22
      User ${username}

    Host homelab
      Hostname 192.168.1.100
      Port 22
      User root
  '';

  users.users.${username}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIh/C3Qmm+9EoNeiLUNsmpvqzGjNF6n0xNUpksIm3xUK psoewish"
  ];
}
