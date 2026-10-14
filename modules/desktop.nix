{ inputs, ... }:
{
  flake.modules.nixos.desktop = { pkgs, ... }: {
    
    imports = [ inputs.dms.nixosModules.default ];

    programs = {
      niri = { enable = true; };
      dank-material-shell = {
        enable = true;
	      systemd = { enable = true; restartIfChanged = true;};
      };
    };    

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-gnome
      ];
      config.common.default = "*";
    };
    
    fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];
      
    environment = {
      systemPackages = with pkgs; [
        xwayland
	      xwayland-satellite
	      bibata-cursors
	      adwaita-icon-theme
      ];
      sessionVariables = {
        XCURSOR_THEME = "Bibata-Modern-Ice";
        XCURSOR_SIZE = "24";
	      QS_ICON_THEME = "Adwaita";
      };
    };

    # services.displayManager.gdm.enable = true;
    # services.desktopManager.gnome.enable = true;
  };
}
