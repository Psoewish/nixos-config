{
  den.aspects.dev.editors.helix.plugins.grove = {
    homeManager = {
      pkgs,
      lib,
      ...
    }: {
      programs.helix.plugins = {inherit (pkgs.helixPlugins) grove-hx;};

      xdg.configFile."helix/init.scm".text = lib.mkAfter ''
        (require "grove/grove.scm")

        (define (grove-workspace-launch?)
          (let loop ([args (cdr (command-line))])
            (cond
              [(null? args) #f]
              [(equal? (car args) "--") #f]
              [(or (equal? (car args) "-w")
                   (equal? (car args) "--working-dir"))
              #t]
              [else (loop (cdr args))])))

        (grove-start!
          #:visibility
          (if (grove-workspace-launch?) 'always 'focused))
      '';
    };
  };
}
