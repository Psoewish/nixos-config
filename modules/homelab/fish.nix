{ ... }:
{
  programs.fish = {
    enable = true;
    useBabelfish = true;
    shellAliases = {
      shx = "sudo hx";
      mkdir = "mkdir -pv";
      cp = "rsync -ah --info=progress2";
    };
  };
}
