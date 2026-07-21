{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nixd
    nixfmt
    alejandra
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
    marksman
    markdown-oxide
    harper
    mpls
    prettier
  ];
}
