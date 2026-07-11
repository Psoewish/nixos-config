{ pkgs, lib, ... }:
let
  inherit (lib) getExe;
  inherit (pkgs.writers) writeFish;
in
{
  programs.fish = {
    enable = true;
    useBabelfish = true;
  };

  environment.systemPackages = with pkgs.fishPlugins; [
    autopair
    done
    puffer
    tide
    sponge
    plugin-sudope
  ];

  hjem.fractal.config.files = {
    "fish/config.fish".source =
      let
        eza = "${getExe pkgs.eza} --all --group-directories-first --git --color=always --icons=always";
      in
      writeFish "config.fish" ''
        set -gx fish_greeting
        set -gx sponge_purge_only_on_exit true
        abbr --add -- ff fastfetch
        abbr --add -- lg lazygit

        alias cat ${getExe pkgs.bat}
        alias cp "rsync -ah --info=progress2"
        alias ls "${eza}"
        alias ll "${eza} --long"
        alias lt "${eza} --tree --level 3"
        alias mkdir "mkdir -pv"
        alias shx "sudo ${getExe pkgs.helix}"
      '';

    "fish/functions/copycat.fish".source = writeFish "copycat.fish" ''
      function copycat
          cat $argv | ${pkgs.wl-clipboard-rs}/bin/wl-copy
      end
    '';
  };
}
