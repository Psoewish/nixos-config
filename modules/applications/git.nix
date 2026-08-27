{
  flake.modules.nixos.git = {pkgs, lib,...}: {
    programs = {
      git = {
        enable = true;
        config = {
          init = {
            defaultBranch = "main";
          };
          user = {
            name = "psoewish";
            email = "personal@psoewish.com";
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
