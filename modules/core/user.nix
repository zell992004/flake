{ pkgs
, inputs
, config
, lib
, ...
}:
{  
  
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users.zell = {
      imports = [ (import ./../home/zell.nix) ];
      home.username = "zell";
      home.homeDirectory = "/home/zell";
      home.stateVersion = "23.11";
      programs.home-manager.enable = true;
    };
  };
 users.users = {
    "zell" = {
    isNormalUser = true;
    description = "Pete";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA9SSRrQ2/MdG1zyVLJEwHmdNYzbciXyWU4dPhyhm91o zell992004@gmail.com"
    ];
    };
 };
 nix.settings.allowed-users = [ "zell" ];
  } 

