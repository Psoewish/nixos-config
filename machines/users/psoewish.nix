{den, ...}: {
  den.aspects.psoewish = {user, ...}: {
    includes = with den._; [
      primary-user
      (tty-autologin "psoewish")
      (user-shell "fish")
    ];
    nixos = {
      security.sudo.wheelNeedsPassword = false;
      nix.settings.trusted-users = [user.name];
      users.users.${user.name}.openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIh/C3Qmm+9EoNeiLUNsmpvqzGjNF6n0xNUpksIm3xUK"
      ];
    };
  };
}
