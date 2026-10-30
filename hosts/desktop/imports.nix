{inputs, ...}: {
  imports = with inputs.self.modules.nixos; [
    dev
    editor
    gaming
    mango
    media

    cli-tools
    discord
    fish
    foot
    helium
    stylix
  ];
}
