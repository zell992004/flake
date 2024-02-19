{...}: {
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = true;
        AllowUsers = ["zell"];
      };
    };
    self-deploy.sshKeyFile = "~/.ssh/id_ed25519";
  };
}
