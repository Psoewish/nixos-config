{
  pkgs,
  username,
  inputs,
  lib,
  ...
}:
let
  dev = {
    name = "dev";
    windows = [
      {
        name = "filetree";
        flex_direction = "row";
        panes = [
          {
            flex = 1;
            flex_direction = "column";
            panes = [
              {
                flex = 1;
                commands = [ { command = "yazi"; } ];
              }
              {
                flex = 1;
              }
            ];
          }
          {
            flex = 4;
            flex_direction = "column";
            panes = [
              {
                flex = 5;
                focus = true;
                commands = [ { command = "hx"; } ];
              }
              {
                flex = 1;
              }
            ];
          }
          {
            flex = 1;
            commands = [ { command = "claude"; } ];
          }
        ];
      }
      {
        name = "main";
        flex_direction = "column";
        panes = [
          {
            flex = 1;
          }
          {
            flex = 1;
          }
        ];
      }
    ];
  };
in
{
  environment.systemPackages = [ inputs.laio.packages.${pkgs.stdenv.hostPlatform.system}.default ];

  home-manager.users.${username} = {
    xdg.configFile."laio/dev.yaml".text = lib.generators.toYAML { } dev;
  };
}
