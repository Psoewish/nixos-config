{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nixd
    nixfmt-rfc-style
    fish-lsp
    bash-language-server
    vscode-langservers-extracted
    marksman
    csharp-ls
    hyprls
    ruff
    rust-analyzer
    tombi
    yaml-language-server
  ];
}
