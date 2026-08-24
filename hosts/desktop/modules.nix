{
  flake.modules.nixos.desktop = {inputs, ...}: {
    imports = with inputs.self.modules.nixos; [
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
      cli-tools
      git

      # applications
      discord
      pear-desktop
      gaming
      qutebrowser
      firefox
      obs

      # theme
      stylix
    ];
  };
}
