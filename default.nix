{
  pkgs,

  # "wow this is hacky" - robin and isabel
  inputs,
  self ? inputs.self,
}:
let
  inherit (inputs) gift-wrap;
in
{
  default = gift-wrap.legacyPackages.${pkgs.system}.wrapNeovim {
    # pretentious i know but this is my neovim config i can do whatever i want
    pname = "atelier";

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
}
