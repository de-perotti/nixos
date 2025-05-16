{ pkgs }: let
in pkgs.mkShell {
  packages = [ pkgs.nodejs_22 ];
}
