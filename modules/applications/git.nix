toplevel @ {config, ...}: {
  flake.modules.nixos.git = {
    pkgs,
    lib,
    ...
  }: {
    programs = {
      git = {
        enable = true;
        config = {
          init = {
            defaultBranch = "main";
          };
          user = {
            name = toplevel.config.flake.meta.primaryUser.username;
            email = toplevel.config.flake.meta.primaryUser.email;
          };
          credential = {
            "https://github.com".helper = ["" "${lib.getExe pkgs.gh} auth git-credential"];
            "https://gist.github.com".helper = ["" "${lib.getExe pkgs.gh} auth git-credential"];
          };
        };
      };
      lazygit.enable = true;
    };
    environment.systemPackages = [pkgs.gh];
  };
}
