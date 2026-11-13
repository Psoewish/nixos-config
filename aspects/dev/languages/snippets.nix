{
  den.aspects.dev.languages.snippets = {
    homeManager = {
      pkgs,
      lib,
      config,
      ...
    }: let
      inherit (lib) mkOption types nameValuePair mapAttrs' filterAttrs;
      inherit (types) attrsOf listOf submodule str nullOr;
    in {
      options.programs.helix.snippets = mkOption {
        type = attrsOf (listOf (submodule {
          options = {
            prefix = mkOption {type = str;};
            scope = mkOption {
              type = nullOr (listOf str);
              default = null;
            };
            description = mkOption {
              type = str;
              default = "";
            };
            body = mkOption {type = str;};
          };
        }));
        description = "Snippets for Simple Completion Language Server";
        default = {};
      };

      config = {
        programs.helix = {
          extraPackages = [pkgs.simple-completion-language-server];
          languages.language-server.scls.command = "simple-completion-language-server";
        };
        xdg.configFile = mapAttrs' (name: snippets:
          nameValuePair "helix/snippets/${name}.toml" {
            source = (pkgs.formats.toml {}).generate "helix-snippets-${name}" {
              snippets = map (filterAttrs (_: v: v != null)) snippets;
            };
          })
        config.programs.helix.snippets;
      };
    };
  };
}
