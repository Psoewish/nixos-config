{ username, config, ... }:
{
  home-manager.users.${username} = {
    programs = {
      git = {
        enable = true;
        settings = {
          # user.email = "${config.sops.secrets."personal/email".path}";
          user.email = "psoewish@proton.me";
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
