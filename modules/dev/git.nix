{ lib, pkgs, ... }:
let
  inherit (lib) getExe;
  inherit (lib.generators) toYAML toGitINI;
  inherit (pkgs) gh helix;
in
{
  programs.git.enable = true;
  hjem.fractal.config.files."git/config" = {
    generator = toGitINI;
    value = {
      user = {
        name = "Psoewish";
        email = "personal@psoewish.com";
      };
      credential."https://github.com".helper = "${getExe gh} auth git-credential";
      credential."https://gist.github.com".helper = "${getExe gh} auth git-credential";
    };
  };

  programs.lazygit.enable = true;

  environment.systemPackages = [ gh ];
  hjem.fractal.config.files."gh/config.yml" = {
    generator = toYAML { };
    value = {
      editor = "${getExe helix}";
      git_protocol = "ssh";
      aliases = {
        ga = "git add -A";
        gc = "git commit -m";
        gp = "git push";
      };
    };
  };
}
