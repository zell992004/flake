{ config, pkgs, theme, inputs, lib, ... }:
with lib;
  let
    cfg = config.modules.firefox;
    userChrome = pkgs.substituteAll;
           src = ./userChrome.css;

in{
  options.modules.firefox = { enable = mkEnableOption "firefox";};
  config = mkIf cfg.enable {
  programs.firefox = {      
      enable = true;
      package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
        extraPolicies = {
          CaptivePortal = false;
          DisableFirefoxStudies = true;
          DisablePocket = true;
          DisableTelemetry = true;
          DisableFirefoxAccounts = true;
          NoDefaultBookmarks = true;
          OfferToSaveLogins = false;
          OfferToSaveLoginsDefault = false;
          PasswordManagerEnabled = false;
          FirefoxHome = {
            Search = false;
            Pocket = false;
            Snippets = false;
            TopSites = false;
            Highlights = false;
          };
          UserMessaging = {
            ExtensionRecommendations = false;
            SkipOnboarding = true;
          };
        };
      };
      profiles = {
        default = {
          id = 0;
          name = "zell";
          search = {
            force = true;
            default = "Google";
            engines = {
              "NixOS Search" = {
                urls = [{ template = "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={searchTerms}"; }];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000;
                definedAliases = [ "@ns-packages" ];
              };
              "NixOS Opt Search" = {
                urls = [{ template = "https://search.nixos.org/options?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={searchTerms}"; }];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000;
                definedAliases = [ "@ns-options" ];
              };
                "Home-Manager Search" = {
                urls = [{ template = "https://mipmip.github.io/home-manager-option-search/?query={searchTerms}"; }];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000;
                definedAliases = [ "@hm" ];
              };
              "Wikipedia (en)".metaData.alias = "@wiki";
              "Amazon.com".metaData.hidden = true;
              "Bing".metaData.hidden = true;
              "eBay".metaData.hidden = true;
            };
          };
          settings = {
            "general.smoothScroll" = true;
            "browser.toolbars.bookmarks.visibility" = "never";
            "privacy.webrtc.legacyGlobalIndicator" = false;
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "browser.compactmode.show" = true;
             };
      };
    };
  };
};
}
