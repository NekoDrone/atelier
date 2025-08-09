{
  description = "Serenity's neovim config";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";

    gift-wrap = {
      url = "github:tgirlcloud/gift-wrap";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      gift-wrap,
    }:
    let
      inherit (nixpkgs) lib;

      forAllSystems =
        f: lib.genAttrs lib.systems.flakeExposed (system: f nixpkgs.legacyPackages.${system});
    in
    {
      packages = forAllSystems (pkgs: {
        nvim = gift-wrap.legacyPackages.${pkgs.system}.wrapNeovim {
          # pretentious i know but this is my neovim config i can do whatever i want
          pname = "atelier";

          # "wow this is hacky" - robin and isabel
          versionSuffix = self.shortRev or self.dirtyShortRev or "unknown";

          aliases = [ "vi" "vim" "nv" "nvm" ];

          userConfig = ./config

        };
      });
    };
}
