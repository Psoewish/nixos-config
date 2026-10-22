{inputs, ...}: {
  imports = with inputs.self.modules.nixos; [
    helix
    zed
    lsp
  ];
}
