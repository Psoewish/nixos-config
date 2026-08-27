function stow_sync
    set -l stow_source "$HOME/nixos-config/home"
    set -l stow_target "$HOME"

    stow --dir="$stow_source" --target="$stow_target" --dotfiles --adopt .
end
