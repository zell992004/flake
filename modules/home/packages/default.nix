{ inputs
, pkgs
, config
, lib
, ...
}: 
  
  with lib;
    let
      cfg = config.modules.packages;
    in {
      
    options.modules.packages = { enable = mkEnableOption "packages"; };
    config = mkIf cfg.enable {
        home.packages = with pkgs; [
      # programming
      nix-prefetch-github
      rnix-lsp
      # others
      openssl
      libnotify
      pamixer
      xfce.thunar
      pavucontrol
      wget
      unzip
      gparted
      mpv
      playerctl
      qalculate-gtk
      bleachbit
      imv
      htop
      nvtop
      xdg-utils
      fzf
      ffmpeg
      bore-cli
      discord
      eza
      libcxxStdenv
      obsidian
# security
    x11_ssh_askpass
    #  sops
#lazyvim
      fd
      gcc
      tree-sitter
      ruby
      nodejs
      
];
    };
}
