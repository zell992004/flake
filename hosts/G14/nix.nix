{ pkgs, inputs, config, ... }: {

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "G14";
    networkmanager.enable = true;
    firewall.enable = false;
  };

     services.xserver = {
    enable = true;
    xkb.layout = "us";
    videoDrivers = ["nvidia" ];
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
}
