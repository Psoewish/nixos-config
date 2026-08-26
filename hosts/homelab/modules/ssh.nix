{
  flake.modules.nixos.homelab = {
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

    users.users."psoewish".openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIh/C3Qmm+9EoNeiLUNsmpvqzGjNF6n0xNUpksIm3xUK psoewish"
    ];
  };
}
