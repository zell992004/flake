{ pkgs, inputs, config, nixpkgs, ... }: {
  imports = [
      ./hardware-configuration.nix
      ./nix.nix
    ];
}


 
