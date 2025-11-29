{ ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          nh
          sops
          git
        ];

        shellHook = ''
          echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
          echo "  NixOS Config Development Shell"
          echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
          echo ""
          echo "Available tools:"
          echo "  nh        - Nix helper tool"
          echo "  sops      - Secret management"
          echo "  git       - Version control"
          echo ""
          echo "Available commands:"
          echo ""
        '';
      };
    };
}
