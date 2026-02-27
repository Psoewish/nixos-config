{ username, ... }:
{
  home-manager.users.${username}.programs = {
    git = {
      enable = true;
      settings = {
        user.email = "personal@psoewish.com";
        user.name = "Psoewish";
      };
    };
    gh = {
      enable = true;
      settings = {
        editor = "hx";
        git_protocol = "ssh";
      };
    };
    lazygit.enable = true;
  };
}
