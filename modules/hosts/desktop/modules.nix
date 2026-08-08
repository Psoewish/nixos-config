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
      openlinkhub

      # dev
      virtualisation
      helix
      zed

      # desktop session
      cosmic

      # terminal stuff
      fish
      ghostty

      # applications
      discord
      pear-desktop
      gaming
      helium
      firefox
      qutebrowser
      obs

      # theme
      catppuccin
    ];
  };
}
