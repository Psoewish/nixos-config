{
  den.aspects.dev.languages.nix = {
    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        nixd
        nil
        alejandra
      ];
    };

    helix-languages.language = [
      {
        name = "nix";
        auto-format = true;
        language-servers = [
          "nixd"
          "nil"
        ];
        formatter.command = "alejandra";
      }
    ];

    zed-languages = {
      Nix = {
        format_on_save = "on";
        formatter.external = {
          command = "alejandra";
          arguments = [
            "--quiet"
            "--"
          ];
        };
        language_servers = [
          "nixd"
          "nil"
        ];
      };
    };
    zed-extensions = ["nix"];
  };
}
