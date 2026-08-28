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
            name = toplevel.config.flake.metadata.primaryUser.username;
            email = toplevel.config.flake.metadata.primaryUser.email;
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
