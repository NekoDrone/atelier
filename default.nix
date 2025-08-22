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
  inherit (lib) map; 

  # declare treesitter grammars here.
  # you can see the list of available grammars here:
  # https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/applications/editors/vim/plugins/nvim-treesitter/generated.nix
  #
  # don't forget to also enable the appropriate file type at ./config/lua/atelier/config/treesitter.lua
  treesitterGrammars = [
    "lua"
    "nix"
    "vim"
    "bash"
  ];

  my_treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (
    p: map (x: p."${x}") treesitterGrammars
  );

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

    # TODO: move plugins not absolutely necessary for initial render to optPlugins
    startPlugins = with pkgs.vimPlugins; [
      my_treesitter
      nvim-lspconfig
      lz-n
      none-ls-nvim
      catppuccin-nvim
      plenary-nvim
      nui-nvim
      neo-tree-nvim
      mini-icons
      lazydev-nvim
      alpha-nvim
    ];

    optPlugins = with pkgs.vimPlugins; [
      indent-blankline-nvim
      rainbow-delimiters-nvim
      gitsigns-nvim
      toggleterm-nvim
    ];

    extraPackages = with pkgs; [
      nodejs_24
      stylua
      prettierd
      lua-language-server
      ripgrep
      tree-sitter
      nixfmt
      lazygit
    ];
  };
}
