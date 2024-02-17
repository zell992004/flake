{pkgs, lib, config, ...}:
{
    nixpkgs = { 
      config = {permittedInsecurePackages = pkgs.liv.optional (pkgs.obsidiain.version == "1.5.3") "electron-25.9.0";
      };
    };

  }

