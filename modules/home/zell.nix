{ inputs, config, lib, pkgs, ... }: {
  imports =
       [ (import ./waybar) ]
    ++ [ (import ./firefox) ]
    ++ [ (import ./codium) ]
    ++ [ (import ./hyprland) ]
    ++ [ (import ./git) ]
    ++ [ (import ./foot) ]
    ++ [ (import ./swaylock) ]
    ++ [ (import ./wofi) ]
    ++ [ (import ./zsh) ]
    ++ [ (import ./mako) ]
    ++ [ (import ./starship) ]
    ++ [ (import ./wlogout) ]
    ++ [ (import ./packages) ]
    ++ [ (import ./tmux)]
    ++ [ (import ./gtk)]
    ++ [ (import ./scripts)]
    ++ [ (import ./nixvim)]
 #   ++ [ (import ./lazyvim)]
    ++ [ ( <nixvim>.homeManagerModules.nixvim)]
    ;
    config.modules = {
        nivim.enable =true;
 #       lazyvim.enable = true;
        tmux.enable = true;
        waybar.enable = true;
        waybarsetting.enable = true;
        waybarstyle.enable = true;
        codium.enable = true;
        hyprland.enable = true;
        hyprconfig.enable = true;
        hyprvar.enable = true;
        git.enable = true;
        foot.enable = true;
        swaylock.enable = true;
        wofi.enable = true;
        zsh.enable = true;
        mako.enable = true;
        starship.enable= true;
        wlogout.enable = true;
        packages.enable = true;
        gtk.enable = true;
        firefox.enable = true;
        scripts.enable = true;
    };
}
