{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.kanata ];

  services.kanata = {
    enable = true;
    keyboards = {
      tartarus = {
        devices = [
          "/dev/input/by-id/usb-Razer_Razer_Tartarus_V2-event-kbd"
          "/dev/input/by-id/usb-Razer_Razer_Tartarus_V2-if02-event-mouse"
        ];
        extraDefCfg = ''
          process-unmapped-keys yes
        '';
        config = ''
          (defsrc
            ;; Top row
            1    2    3    4    5
            ;; Second row
            tab  q    w    e    r
            ;; Third row
            caps a    s    d    f
            ;; Bottom row
            lsft z    x    c    v
            ;; Thumb and big button
            lalt           spc
            ;; D-pad
            up   left down rght
            ;; Scroll wheel
            mwu  mmid   mwd
          )

          (deflayer base
            ;; Top row
            esc  1    2    3    4
            ;; Second row
            tab  q    w    e    r
            ;; Third row
            lctl a    s    d    f
            ;; Bottom row
            lsft z    x    c    v
            ;; Thumb button
            spc            v
            ;; D-pad
            y    i    h    m
            ;; Scroll wheel
            pgup grv pgdn
          )
        '';
      };
    };
  };
}
