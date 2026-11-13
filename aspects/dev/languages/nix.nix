{
  den.aspects.dev.languages.nix = {
    homeManager = {pkgs, ...}: {
      programs.helix = {
        extraPackages = with pkgs; [
          nixd
          nil
          alejandra
        ];
        languages.language = [
          {
            name = "nix";
            auto-format = true;
            language-servers = ["nixd" "nil" "scls"];
            formatter.command = "alejandra";
          }
        ];

        snippets.nix = [
          # Snippet bootstrapping snippets :)
          {
            prefix = "snippet";
            description = "Create a snippet for helix";
            body = ''
              {
                prefix = "$1";
                description = "$2";
                body = '''
                  $3
                ''';
              } $0
            '';
          }

          # Den snippets
          {
            prefix = "aspect";
            description = "Create a Den aspect";
            body = ''
              den.aspects.$1 = {
                $2
              }; $0
            '';
          }
          {
            prefix = "nixos";
            description = "Generate a nixos scope block";
            body = ''
              nixos = {
                $1
              }; $0
            '';
          }
          {
            prefix = "nixoswith";
            description = "Generate a nixos scope block with extra arguments";
            body = ''
              nixos = {$1, ...}: {
                $2
              }; $0
            '';
          }

          {
            prefix = "home";
            description = "Generate a homeManager scope block";
            body = ''
              homeManager = {
                $1
              };
            '';
          }
          {
            prefix = "homewith";
            description = "Generate a homeManager scope block with extra arguments";
            body = ''
              homeManager = {$1, ...}: {
                $2
              }; $0
            '';
          }

          # General purpose nix snippets
          {
            prefix = "letin";
            description = "let .. in block";
            body = ''
              let
                $1
              in $0
            '';
          }
          {
            prefix = "if";
            description = "if .. else block";
            body = ''
              if $1
              then $2
              else $3
            '';
          }
          {
            prefix = "with";
            description = "with expression";
            body = ''
              with $1; $0
            '';
          }
          {
            prefix = "inherit";
            description = "inherit expression";
            body = ''
              inherit $1;
            '';
          }
        ];
      };
    };

    # You're on the chopping block, bud
    zed-languages = {
      Nix = {
        format_on_save = "on";
        formatter.external = {
          command = "alejandra";
          arguments = ["--quiet" "--"];
        };
        language_servers = ["nixd" "nil"];
      };
    };
    zed-extensions = ["nix"];
  };
}
