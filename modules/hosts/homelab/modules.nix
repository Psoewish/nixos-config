{
  flake.modules.nixos.homelab = {inputs, ...}: {
    imports = with inputs.self.modules;
      (with nixos; [
        # hardware
        intelcpu
        intelgpu
        helix
        fish
        ghostty
        # theme
        catppuccin
      ])
      ++ [(generic.constants)];
  };
}
