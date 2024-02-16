{...}: {
  services = {
    gvfs.enable = true;
    zell.enableGnomeKeyring = true;
    dbus.enable = true;
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = true;
        AllowUsers = ["zell"];
      };
    };
  };
}
