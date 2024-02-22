{config, lib, pkgs, ...}:
with lib;
let
cfg = config.modules.tmux;
in {
options.modules.tmux = {enable = mkEnableOption "tmux";};
config = mkIf cfg.enable {
programs.tmux ={
  enable = true;
  shell = "/run/current-system/sw/bin/zsh";
  terminal = "screen-256color";
  escapeTime = 10;
  plugins = (with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.continuum
      tmuxPlugins.resurrect
      ]);
  extraConfig = ''
  set-option -g mouse on
  resurrect_dir="$HOME/.tmux/resurrect"
  set -g @resurrect-dir $resurrect_dir
  set -g @resurrect-hook-post-save-all 'target=$(readlink -f $resurrect_dir/last); sed "s| --cmd .*-vim-pack-dir||g; s|/etc/profiles/per-user/$USER/bin/||g; s|/home/$USER/.nix-profile/bin/||g" $target | sponge $target'
  set -g @continuum-boot 'on'
  set -g @continuum-boot-options 'foot'
  '';
};
};
}
