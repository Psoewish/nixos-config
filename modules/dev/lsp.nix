{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fish-lsp
    bash-language-server
    vscode-langservers-extracted
    csharp-ls
    ruff
    rust-analyzer
    lldb
    tombi
    yaml-language-server
    lua-language-server
  ];
}
