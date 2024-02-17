{pkgs, inputs, config, ...}: {
     modules =
         [ (import ./../../modules/core/hardware.nix) ]
      ++ [ (import ./../../modules/core/pipewire.nix) ]
      ++ [ (import ./../../modules/core/program.nix) ]
      ++ [ (import ./../../modules/core/security.nix) ]
      ++ [ (import ./../../modules/core/services.nix) ]
      ++ [ (import ./../../modules/core/system.nix) ]
      ++ [ (import ./../../modules/core/user.nix) ]
      ++ [ (import ./../../modules/core/wayland.nix) ]
      ++ [ (import ./hardware-configuration.nix) ]
      ++ [ (import ./default.nix) ]
      ++ [ (import ../homemanager.nix)]
    ;
 
boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
#  boot.initrd.kernelModules = [ "intel" ];
  networking = {
    hostName = "P72";
    networkmanager.enable = true;
    firewall.enable = false;
  };
   services.xserver = {
    enable = true;
    layout = "us";
    videoDrivers = [ "nvidia" ];
    displayManager.autoLogin = {
      enable = true;
      user = "zell";
    };
    libinput = {
      enable = true;
      mouse = {
        accelProfile = "flat";
      };
    };
  };
services.gvfs.enable = true;
services.hardware.bolt.enable = true;
 hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false;
    nvidiaSettings = true;
  #  package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
