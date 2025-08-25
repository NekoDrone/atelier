# if a plugin isn't found in nixpkgs.vimPlugins,
# add to this list and then also do the same in the default.nix
#
# currently, it assumed that plugins added here are optPlugins.
{ pkgs, ... }:

{
  beacon-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "beacon.nvim";
    version = "2024-06-25";
    src = pkgs.fetchFromGitHub {
      owner = "DanilaMihailov";
      repo = "beacon.nvim";
      rev = "25b47361442dd08371b3110611da7c4ea89758b8";
      hash = "sha256-N6/Wh/ZtfjkvmjgrfzpQ6CrAKCdAnvkqlmYoKBcGJCs=";
    };
  };
  nivvie-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "nivvie.nvim";
    version = "2025-08-22";
    src = pkgs.fetchFromGitHub {
      owner = "comfysage";
      repo = "nivvie.nvim";
      rev = "f2ee7cd6aae80f7b3a7ed9c6f7c3b21110fb5706";
      hash = "sha256-sUHC146fALmpBcyk6yW8uIdBXVzu5oBHuTr/sGMq3sc=";
    };
  };
}
