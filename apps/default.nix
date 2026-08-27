{
  perSystem = {pkgs, ...}: {
    apps = {
      stow_sync = let
        stow_source = "$HOME/nixos-config/home";
        stow_target = "$HOME";
      in {
        type = "app";
        program = pkgs.writeShellApplication {
          name = "Sync dotfiles with GNU Stow";
          text = ''stow --dir="${stow_source}" --target="${stow_target}" --dotfiles --adopt .'';
        };
      };
    };
  };
}
