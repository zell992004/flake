{
  config,
  pkgs,
  lib,
  helpers,
  ...
}:
with lib;
let 
  cfg = config.modules.nixvim;
in {
  options.modules.nixvim = { enable = mkEnableOption "nixvim";};
  config = mkIf cfg.enable {

 # programs.lazygit.enable = true;

    programs.nixvim = {
      enable = true;
    };
  };
}
