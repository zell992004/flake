{
  config,
  pkgs,
  lib,
  helpers,
  ...
}:
with lib;
let 
  cfg = config.modules.nixvim;
in {
  options.modules.nixvim = { enable = mkEnableOption "nixvim";};
  config = mkIf cfg.enable {

 # programs.lazygit.enable = true;

    programs.nixvim = {
      enable = true;
      colorschemes = {
          gruvbox.enable=true;
      };
        plugins = {
            lightline.enable = true;
         #   nvim-cmp = {
         #       enable = true;
         #       
         #     };
         #     luasnip = {
         #       enable = true;
         #       extraConfig = { 
         #         enable_autosnippets = true;
         #         store_selection_keys = "tab";
         #         };
         #     };
         #     mini = {
         #         enable = true;
         #         modules = {
         #             pairs = {};
         #             surround = {};
         #             ai = {};
         #             comment = {};
         #             bufremove = {};
         #             indentscope = {};
         #        };
         #     };
         #   neo-tree = {
         #       enable = true;
         #       enableGitStatus = true;
         #       enableRefreshOnWrite = true;
         #     };
         #   which-key = {
         #       enable = true;
#
         #     };
         #   gitsigns = {
         #       enable = true;
         #     };
         #   telescope = {
         #       enable = true;
         #     };
         #   conform-nvim = {
         #     enable = true;
         #     };
         #   treesitter = {
         #     enable = true;
         #   };
         #   treesitter-textobjects = {
         #       enable = true;
         #     };
         #   treesitter-context = {
         #       enable = true;
         #     };
         #   notify = {
         #       enable = true;
         #     };
         #   bufferline = {
         #       enable = true;
         #     };
         #   lualine = {
         #       enable = true;
         #     };
         #   indent-blankline = {
         #       enable = true;
         #     };
         #   noice = {
         #       enable = true;
         #     };
         #   dashboard = {
         #       enable = true;
         #     };
       };
    };
  };
}
