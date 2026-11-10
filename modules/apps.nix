{ inputs, ... }:
{
  flake.modules.nixos.apps = { pkgs, ... }: {


    programs.firefox.enable = true;

    home-manager.users.karvono14 = {

      imports = [inputs.zen.homeModules.default]; 

      programs.yazi = {
        enable = true;
      };

      programs.zen-browser = {
        enable = true;
        # Catppuccin theme (catppuccin/zen-browser), symlinked into the profile's
        # chrome/catppuccin and loaded via userChrome/userContent imports.
        profiles.default.presets.catppuccin = {
          enable = true;
          flavor = "Mocha"; # Frappe | Latte | Macchiato | Mocha
          accent = "Lavander"; # Blue, Flamingo, Green, Lavender, Maroon, Mauve, ...
        };

        # Betterfox for Zen (yokoffing/Betterfox zen/user.js, aka BetterZen):
        # privacy/telemetry/performance prefs applied as mkDefault settings —
        # any profile `settings` entry wins.
        profiles.default.presets.betterfox.enable = true;

        # arkenfox for Zen (arkenfox/user.js)
        profiles.default.presets.arkenfox.enable = true;
      };
    };


    environment.systemPackages = with pkgs; [
      pacman
      nox
      aseprite
      keepassxc
      nautilus
      adw-gtk3
      ncdu
      krita
      libreoffice
      p7zip
      obsidian
      wf-recorder
      slurp
      bat
      mpv
      eza
      ranger
      image-roll

      # inputs.tfm.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.serein.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.concat.packages.${pkgs.stdenv.hostPlatform.system}.default

      # (rWrapper.override {
      #   packages = with rPackages; [
      #     mpv
      #   ];
      # })

    ];

    virtualisation.virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
    };

    services = {
      gvfs.enable = true;
      tumbler.enable = true;
    };
  };
}
