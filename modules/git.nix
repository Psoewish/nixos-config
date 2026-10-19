{
  pkgs,
  lib,
  meta,
  ...
}: {
  programs = {
    git = {
      enable = true;
      config = {
        init = {
          defaultBranch = "main";
        };
        user = {inherit (meta.git) name email;};
        credential = {
          "https://github.com".helper = [
            ""
            "${lib.getExe pkgs.gh} auth git-credential"
          ];
          "https://gist.github.com".helper = [
            ""
            "${lib.getExe pkgs.gh} auth git-credential"
          ];
        };
      };
    };
    lazygit.enable = true;
  };
  environment.systemPackages = [pkgs.gh];
}
