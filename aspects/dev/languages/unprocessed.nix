{
  den.aspects.dev.languages.unprocessed = {
    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        vscode-langservers-extracted
        ruff
        rust-analyzer
        lldb
        tombi
        prettier
      ];
    };
  };
}
