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
      # umbriel
      # ghostty

      # terminal stuff
      fish
      nix-direnv
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
