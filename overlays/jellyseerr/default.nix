{ ... }:
{
  fractal.tags = [ "overlays" ];
  nixpkgs.overlays = [
    (final: prev: {
      jellyseerr = prev.jellyseerr.overrideAttrs (old: {
        version = "preview-OIDC";
        src = prev.fetchFromGitHub {
          owner = "seerr-team";
          repo = "seerr";
          rev = "preview-OIDC";
          hash = "sha256-EJz1W7ewEczizNRs/X3esjQUwJiTHruo7nkAzyKZbjc=";
        };
        pnpmDeps = prev.fetchPnpmDeps {
          inherit (old) pname;
          fetcherVersion = 1;
          src = prev.fetchFromGitHub {
            owner = "seerr-team";
            repo = "seerr";
            rev = "preview-OIDC";
            hash = "sha256-EJz1W7ewEczizNRs/X3esjQUwJiTHruo7nkAzyKZbjc=";
          };
          hash = "sha256-yjrlZfObAMj9WOywlsP51wNrbUNh8m1RxtbkjasnEW4=";
        };
        pname = "seerr";
      });
    })
  ];
}
