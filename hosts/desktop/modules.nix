{
  flake.modules.nixos.desktop = {inputs, ...}: {
    imports = with inputs.self.modules.nixos; [
      # hardware
      amdcpu
      amdgpu

      # input devices
      vial
      streamcontroller
      input-remapper

      # dev
      virtualisation
      helix
      zed

      # desktop session
      cosmic

      # terminal stuff
      fish
      nix-direnv
      nixos-cli
      fastfetch

      # applications
      discord
      pear-desktop
      gaming
      chromium
      qutebrowser
      obs

      # theme
      stylix
    ];
  };
}
