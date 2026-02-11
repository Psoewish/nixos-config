{ ... }:
{
  programs = {
    git = {
      enable = true;
      settings = {
        user.email = "personal@psoewish.com";
        user.name = "Psoewish";
      };
    };
    gh = {
      enable = true;
      settings.editor = "hx";
    };
    lazygit.enable = true;
  };
}
