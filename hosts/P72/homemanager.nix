{pkg, inputs, config, ...}: {
   home-manager.users.zell.wayland.windowManager.hyprland.settings.monitor = [
     "eDP-1,3840x2160,0x0,2"
     "HDMI-A-1,1920x1080,1920x0, 1"
     "DP-5,1920x1080,3840x0, 1"
     "DP-4,1920x1080,-1920x0,1"
      ];
}
