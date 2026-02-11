{ ... }:
{
  programs.eza = {
    enable = true;
    git = true;
    icons = "auto";
    colors = "always";
    extraOptions = [
      "--all"
      "--group-directories-first"
    ];
  };
}
