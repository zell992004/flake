{ pkgs, ... }: {
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.tmux.enable = true;
  programs.xwayland.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "curses";
  };
}
