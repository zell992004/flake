{pkgs, inputs, config, nixpkgs, self, ...}: {
   home-manager.users.zell = { 
    wayland.windowManager.hyprland.settings.monitor = [
     "eDP-1,1920x1080,0x0,1"
     "DP-3,1920x1080,0x-1080, 1"
     "HDMI-A-1,1920x1080,-1920x-1080, 1"
     "DP-2,1920x1080,-3840x-1080,1"
      ]; 
 #   wayland.windowManager.hyprland.settings.workspace = [
 #   "workspace=1,name:Terminal,monitor:HDMI-A-1"
 #   "workspace=4,name:Notes,monitor:eDP-1"
 #   "workspace=2,name:web.monitor:DP-3"
 #   ];
    };
}
