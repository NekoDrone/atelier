{
  pkgs,
  lib,

  # "wow this is hacky" - robin and isabel
  inputs,
  self ? inputs.self,
  atelierVersion ? self.shortRev or self.dirtyShortRev or "unknown",
  ...
}:
let
  inherit (inputs) gift-wrap;
  inherit (lib) attrValues filterAttrs elem;

  treesitterGrammars = [
    "lua"
    "nix"
  ];

in
{
  default = gift-wrap.legacyPackages.${pkgs.system}.wrapNeovim {
    # pretentious i know but this is my neovim config i can do whatever i want
    pname = "atelier";

    versionSuffix = atelierVersion;

    aliases = [
      "vi"
      "vim"
      "nv"
      "nvm"
    ];

    userConfig = ./config;

    startPlugins = with pkgs.vimPlugins; [
      nvim-treesitter
      nvim-lspconfig
      lz-n
      none-ls-nvim
      catppuccin-nvim
      plenary-nvim
      nui-nvim
      neo-tree-nvim
      mini-icons
      lazydev-nvim
    ] ++ (attrValues (filterAttrs (name: _: elem name treesitterGrammars) nvim-treesitter.grammarPlugins));

    # optPlugins = with pkgs.vimPlugins; [
    #   catppuccin-nvim
    # ];

    extraPackages = with pkgs; [
      nodejs_24
      stylua
      prettierd
      lua-language-server
      ripgrep
      tree-sitter
    ];
  };
}
