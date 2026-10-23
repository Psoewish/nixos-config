{
  inputs,
  lib,
  ...
}: {
  imports = [inputs.direnv-instant.nixosModules.direnv-instant];
  programs = {
    direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };
    direnv-instant.enable = true;
  };
  hjem.users.psoewish.xdg.config.files."direnv/direnvrc".source = lib.mkSymlink ./config/direnvrc;
  hjem.users.psoewish.xdg.config.files."direnv/direnv.toml".source = lib.mkSymlink ./config/direnv.toml;
}
