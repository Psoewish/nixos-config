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
    lldb
    tombi
    yaml-language-server
    lua-language-server
  ];
}
