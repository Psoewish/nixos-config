{
  flake.modules.homeManager.cli-tools = {pkgs, ...}: {
    programs.bat = {
      enable = true;
      extraPackages = [pkgs.bat-extras.batman];
      config = {
        italic-text = "always";
        paging = "never";
        style = "plain";
      };
    };
  };
}
