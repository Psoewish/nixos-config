{
  flake.modules.homeManager.zed = {
    programs.zed-editor.extensions = [
      "nix"
      "html"
      "pylsp"
      "basher"
      "hyprlang"
      "fish"
      "xml"
      "toml"
      "scss"
      "lua"
      "csharp"
      "dockerfile"
      "docker-compose"
      "rainbow-csv"
      "zig"
      "ini"
      "nu"
      "qml"
      "jq"
      "desktop"
      "json5"
      "color-highlight"
    ];
  };
}
