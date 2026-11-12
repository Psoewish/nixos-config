{
  den.aspects.shell.tools.cli-tools = {
    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        curl
        fd
        fzf
        jq
        killall
        socat
        wget
        unzip
        unrar
        zip
        bind
        wl-clipboard-rs
        wl-clip-persist
        eza
        bat
        bat-extras.batman
        bat-extras.batgrep
      ];
    };
  };
}
