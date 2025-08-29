inputs:
{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.atelier;

  pkgs' = import ../default.nix { inherit pkgs inputs lib; };
in
{
  options = {
    programs.atelier = {
      enable = lib.mkEnableOption "atelier";
      package = lib.mkPackageOption pkgs' "atelier" { };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ cfg.package ];
  };
}
