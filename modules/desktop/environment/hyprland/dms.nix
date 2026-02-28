{ inputs, ... }:
{
  imports = with inputs; [ dms.nixosModules.dank-material-shell ];

  programs.dank-material-shell = {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    enableSystemMonitoring = true;
    enableClipboardPaste = true;
  };
}
