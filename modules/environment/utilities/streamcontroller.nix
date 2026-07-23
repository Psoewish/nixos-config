{ inputs, ... }: {
  nixpkgs.overlays = [ inputs.streamcontroller.overlays.default ];
  imports = [ inputs.streamcontroller.nixosModules.default ];

  programs.streamcontroller = {
    enable = true;
    autostart = true;
  };
}
