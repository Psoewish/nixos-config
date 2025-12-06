{ username, ... }:
{
  home-manager.users.${username} =
    { inputs, ... }:
    {
      imports = [ inputs.ignis.homeManagerModules.default ];
      programs.ignis = {
        enable = true;
        addToPythonEnv = true;
        services = {
          bluetooth.enable = true;
          recorder.enable = true;
          audio.enable = true;
          network.enable = true;
        };
      };
    };
}
