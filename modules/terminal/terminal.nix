{inputs, ...}: {
  imports = with inputs.self.modules.nixos; [
    fastfetch
    fish
    foot
    cli
    zellij
  ];
}
