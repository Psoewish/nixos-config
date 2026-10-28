{inputs, ...}: {
  imports = with inputs.self.modules.nixos; [
    browser
    dev
    social
    terminal
    media
    gaming
    shell
    editor

    mango
  ];
}
