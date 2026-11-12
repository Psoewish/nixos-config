{
  den.aspects.input-devices.gamesir = {
    nixos = {
      services.udev.extraRules = ''
        SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3537", TAG+="uaccess"
        SUBSYSTEM=="scsi_generic", ATTRS{idVendor}=="4c4a", TAG+="uaccess"
        SUBSYSTEM=="block", ATTRS{idVendor}=="4c4a", TAG+="uaccess", ENV{UDISKS_IGNORE}="1"
      '';
    };
  };
}
