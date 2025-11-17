{ username, ... }:
{
  home-manager.users.${username} = {
    programs = {
      git = {
        enable = true;
        settings = {
          user.email = (import ../../secrets/soft-secrets.nix).email;
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
