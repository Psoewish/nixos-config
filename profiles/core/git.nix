{ username, softSecrets, ... }:
{
  home-manager.users.${username} = {
    programs = {
      git = {
        enable = true;
        settings = {
          user.email = softSecrets.email;
          user.name = "Psoewish";
        };
      };
      gh = {
        enable = true;
        settings.editor = "hx";
      };
    };
  };
}
