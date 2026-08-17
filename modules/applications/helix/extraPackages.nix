{
  flake.modules.homeManager.helix = {pkgs, ...}: {
    programs.helix.extraPackages = with pkgs; [
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
      typescript-language-server
      marksman
      markdown-oxide
      harper
      mpls
      prettier
    ];
  };
}
