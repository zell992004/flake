{ pkgs, inputs, config, ... }: {
  import = {
      ./hardware-configuration.nix
      ./nix.nix
      ./homemanager.nix
    };
}


 
