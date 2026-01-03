{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nixd
    nixfmt-rfc-style
    fish-lsp
    bash-language-server
    vscode-langservers-extracted
    marksman
    markdown-oxide
    prettier
    mpls
    csharp-ls
    hyprls
    ruff
    rust-analyzer
    lldb
    tombi
    yaml-language-server
    lua-language-server
    harper
  ];
}
