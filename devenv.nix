{
  pkgs,
  lib,
  ...
}: {
  env.GREET = "devenv";

  packages = with pkgs; [sops];

  # languages.rust.enable = true;

  scripts.stow_sync.exec = ''
    stow_source="$HOME/nixos-config/home"
    stow_target="$HOME"

    ${lib.getExe pkgs.stow} --dir="$stow_source" --target="$stow_target" --dotfiles --adopt .
  '';
}
