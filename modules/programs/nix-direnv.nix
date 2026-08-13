{
  flake.modules.nixos.nix-direnv = {inputs, ...}: {
    home-manager.sharedModules = [inputs.self.modules.homeManager.nix-direnv];
  };

  flake.modules.homeManager.nix-direnv = {inputs, ...}: {
    imports = [(inputs.direnv-instant.homeModules.direnv-instant or {})];
    programs = {
      direnv = {
        enable = true;
        silent = true;
        nix-direnv.enable = true;
        stdlib = ''
          : ''${XDG_CACHE_HOME:=$HOME/.cache}
          declare -A direnv_layout_dirs
          direnv_layout_dir() {
            echo "''${direnv_layout_dirs[$PWD]:=$(
              echo -n "$XDG_CACHE_HOME"/direnv/layouts/
              echo -n "$PWD" | sha1sum | cut -d ' ' -f 1
            )}"
          }
        '';
      };
      direnv-instant.enable = true;
    };
  };
}
