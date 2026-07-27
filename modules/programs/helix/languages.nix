{ ... }: {
  flake.modules.homeManager.helix = {
    programs.helix.languages.language = [
      {
        name = "nix";
        auto-format = true;
        language-servers = [ "nixd" ];
        formatter.command = "alejandra";
      }
      {
        name = "lua";
        auto-format = true;
      }
      {
        name = "markdown";
        auto-format = true;
        language-servers = [
          "marksman"
          "markdown-oxide"
          "harper-ls"
          "mpls"
        ];
        formatter = {
          command = "prettier";
          args = [
            "--parser"
            "--markdown"
            "--prose-wrap"
            "never"
          ];
        };
      }
    ];
  };
}
