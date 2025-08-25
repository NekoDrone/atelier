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
    "vimdoc"
    "bash"
    "css"
    "html"
    "javascript"
    "jsdoc"
    "typescript"
    "tsx"
    "json"
    "just"
    "rust"
    "gleam"
    "go"
    "gomod"
    "gosum"
    "gotmpl"
    "gowork"
    "c_sharp"
    "cpp"
    "c"
    "csv" # because i hate myself
    "yaml" # because i hate myself 2
    "toml"
    "markdown"
    "markdown_inline"
    "nginx"
    "ocaml"
    "fsharp"
    "haskell"
    "graphql"
    "sql"
    "ssh_config"
    "svelte"
    "vue"
    "angular"
    "astro"
    "xml"
    "zig"
    "caddy"
    "dockerfile"
    "elixir"
    "elm"
    "erlang"
    "fish"
    "gitignore"
    "gitcommit"
    "git_config"
    "git_rebase"
    "gitattributes"
    "http"
    "ini"
    "java"
    "javadoc"
    "jq"
    "kotlin"
    "latex"
    "llvm"
    "objc"
    "swift"
    "odin"
    "php"
    "phpdoc"
    "powershell" # because i hate myself 3
    "printf"
    "python"
    "razor"
    "regex"
    "robots"
    "ruby"
    "scss"
    "templ"
    "tera"
  ];

  my_treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (
    p: map (x: p."${x}") treesitterGrammars
  );

  # TODO: discriminate on optional or start plugins.
  # will need to do a partition.
  atelierPlugins = import ./pkgs/plugins.nix { inherit pkgs; };

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

    startPlugins =
      with pkgs.vimPlugins;
      [
        plenary-nvim
        nui-nvim
        my_treesitter
        nvim-lspconfig
        lz-n
        neo-tree-nvim
        lualine-nvim
        fidget-nvim
        bufferline-nvim
        cord-nvim
      ]
      ++ (with atelierPlugins; [
        beacon-nvim
        nivvie-nvim
      ]);

    optPlugins = with pkgs.vimPlugins; [
      none-ls-nvim
      catppuccin-nvim
      mini-icons
      lazydev-nvim
      alpha-nvim
      indent-blankline-nvim
      rainbow-delimiters-nvim
      gitsigns-nvim
      toggleterm-nvim
      telescope-nvim
      blink-cmp
      nvim-autopairs
      dropbar-nvim
      refactoring-nvim
      lspsaga-nvim
      trouble-nvim
      todo-comments-nvim
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
