{ inputs, ... }:
{
  flake.modules.nixos.dev = { pkgs, config, ... }: {

    programs.git.enable = true;
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc.lib
        libgcc
        zlib
        freetype
        fontconfig
        libX11
        libXext
        libXrender
        libXtst
        libXi
        libXrandr
        alsa-lib
      ];
    };

    virtualisation.docker = {
      enable = true;
      enableOnBoot = false;
    };

    environment.systemPackages = with pkgs; [
      devenv
      glow
      jq
      gh
      github-desktop
      # inputs.yazelix.packages.${pkgs.stdenv.hostPlatform.system}.yazelix # <-- el ultimo atributo es el nombre del archivo en el repo
    ];

  };
}
