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

      atelier = forAllSystems (pkgs: {
        default = gift-wrap.legacyPackages.${pkgs.system}.wrapNeovim {
          # pretentious i know but this is my neovim config i can do whatever i want
          pname = "atelier";

          # "sensible default" - robin and isabel
          versionSuffix = self.shortRev or self.dirtyShortRev or "unknown";

          aliases = [
            "vi"
            "vim"
            "nv"
            "nvm"
          ];

          userConfig = ./config;

	  startPlugins = with pkgs.vimPlugins; [
            nvim-treesitter.withAllGrammars
            nvim-lspconfig
          ];

        };
      });

    in
    {
      packages = atelier;
    };
}
