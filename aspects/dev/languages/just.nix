{
  den.aspects.dev.languages.just = {
    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        just
        just-lsp
      ];
    };

    helix-languages = {
      language = [
        {
          name = "just";
          auto-format = true;
          language-servers = ["just-lsp"];
        }
      ];
    };

    zed-languages = {
      Nix = {
        format_on_save = "on";
        language_servers = ["just-lsp"];
      };
    };
    zed-extensions = ["justfile"];
  };
}
