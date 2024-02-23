{
  config,
  pkgs,
  lib,
  ...
}:
with lib;
let 
  cfg = config.modules.nixvim;
in {
  options.modules.nixvim = { enable = mkEnableOption "nixvim";};
  config = mkIf cfg.enable {

  programs.lazygit.enable = true;

  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;
    plugins = {
        lightline.enable = true
      };
    };
  };
}
