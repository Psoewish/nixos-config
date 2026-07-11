{ pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    (vscode-vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with vscode-extensions; [ ];
    })
  ];
}
