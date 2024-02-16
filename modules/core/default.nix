{inputs, nixpkgs, self, nixos-hardware, ...}:
let system = "x86_64-linux";
pkgs = import nixpkgs {
  inherit system;
  config.allowUnfree = true;
};
lib = nixpkgs.lib;
in 
{ 
P72 = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs; };
    modules =
      [ nixos-hardware.nixosModules.lenovo-thinkpad-p52]
      ++ [ (import ./hardware.nix) ]
      ++ [ (import ./pipewire.nix) ]
      ++ [ (import ./program.nix) ]
      ++ [ (import ./security.nix) ]
      ++ [ (import ./services.nix) ]
      ++ [ (import ./system.nix) ]
      ++ [ (import ./user.nix) ]
      ++ [ (import ./wayland.nix) ]
      ++ [ (import ./../../hosts/P72/hardware-configuration.nix) ]
      ++ [ (import ./../../hosts/P72/default.nix) ]
    ;
  };
}
