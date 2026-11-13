{
  den.aspects.dev.languages.markdown = {
    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        marksman
        harper
        mpls
        prettier
      ];
    };

    helix-languages = {
      language = [
        {
          name = "markdown";
          auto-format = true;
          language-servers = ["marksman" "harper-ls" "mpls"];
          formatter = {
            command = "prettier";
            args = ["--parser" "markdown" "--prose-wrap" "never"];
          };
        }
      ];
      language-server = {
        harper-ls = {
          command = "harper-ls";
          args = ["--stdio"];
        };
        mpls = {
          command = "mpls";
          args = ["--theme" "dark" "--enable-wikilinks" "--enable-emoji" "--full-sync"];
        };
      };
    };

    zed-languages = {
      Markdown = {
        format_on_save = "on";
        language_servers = ["marksman" "harper-ls"];
        formatter.external = {
          command = "prettier";
          arguments = ["--parser" "markdown" "prose-wrap" "never"];
        };
      };
    };
    zed-extensions = ["marksman" "harper"];
  };
}
