{
  flake.modules.homeManager.fish = { pkgs, lib, ... }: {
    programs.fish.shellAliases = {
      cat = "${lib.getExe pkgs.bat}";
      man = "${lib.getExe pkgs.bat-extras.batman}";
      shx = "sudo ${lib.getExe pkgs.helix}";
      mkdir = "mkdir -pv";
      cp = "${lib.getExe pkgs.rsync} -ah --info=progress2";
      ls = "${lib.getExe pkgs.eza} --all";
      ll = "${lib.getExe pkgs.eza} --long --all";
      lt = "${lib.getExe pkgs.eza} --tree --level 3 --git-ignore";
      ff = "${lib.getExe pkgs.fastfetch}";
      lg = "${lib.getExe pkgs.lazygit}";
    };
  };
}
