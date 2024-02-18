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
    [ (../../hosts/P72/default.nix ) ]
 ++ [ (nixos-hardware.nixosModules.lenovo-thinkpad-p52)]
# ++ [ (sops-nix.nixosModules.sops-nix)]

    ;
  };

#wsl = nixpkgs.lib.nixosSystem {
#    specialArgs = { inherit self inputs; };
#    modules = 
#         [ (modulesPath + "/profiles/minimal.nix") ] 
#      ++ [self.inputs.nixos-wsl.nixosModules.wsl]
#      ++ [ (import ./../../hosts/wsl/default.nix)]
#      ;
#  };
}
