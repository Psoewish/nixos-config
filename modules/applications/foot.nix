{
  flake.modules.nixos.foot = {
    programs.foot = {
      enable = true;
      xdg.serverAutostart = true;
    };
  };
}
