{
  flake.modules.nixos.nix-direnv = {inputs, ...}: {
    imports = [inputs.direnv-instant.nixosModules.direnv-instant];
    programs = {
      direnv = {
        enable = true;
        silent = true;
        direnvrcExtra = ''
          : ''${XDG_CACHE_HOME:=$HOME/.cache}
          declare -A direnv_layout_dirs
          direnv_layout_dir() {
            echo "''${direnv_layout_dirs[$PWD]:=$(
              echo -n "$XDG_CACHE_HOME"/direnv/layouts/
              echo -n "$PWD" | sha1sum | cut -d ' ' -f 1
            )}"
          }
        '';
        nix-direnv.enable = true;
      };
      direnv-instant.enable = true;
    };
  };
}
