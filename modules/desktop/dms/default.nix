{ username, ... }:
{
  home-manager.users.${username} =
    { inputs, ... }:
    {
      imports = [ inputs.dms.homeModules.dankMaterialShell.default ];
      programs.dankMaterialShell = {
        enable = true;
        systemd.enable = true;
        systemd.restartIfChanged = true;

        default.settings = {
          cornerRadius = 0;
        };
      };
    };
}
