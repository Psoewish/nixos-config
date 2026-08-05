{
  flake.modules.nixos.desktop = {inputs, ...}: {
    imports = with inputs.self.modules;
      (with nixos; [
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
        obs

        # theme
        catppuccin
      ])
      ++ [(generic.constants)];
  };
}
