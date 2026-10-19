{ ... }:
{
  flake.modules.nixos.shell =
    { pkgs, ... }:
    let
      nixos = builtins.fromJSON ''"\uf313"''; # logo de NixOS
      nixCopo = builtins.fromJSON ''"\udb84\udd05"''; # copo (U+F1105)
    in
    {
      programs = {
        zoxide.enable = true;

        starship = {
          enable = true;
          presets = [
            "nerd-font-symbols"
            #            "jetpack"
            "pure-preset"
          ];
          settings = {
            character = {
              success_symbol = "[❯](bold green)";
              error_symbol = "[❯](bold red)";
            };
          };
          /*
            settings = {
              character = {
                success_symbol = "[${nixos}](bold bright-blue)"; # comando correcto
                error_symbol   = "[${nixos}](bold red)";         # el último comando falló
                vimcmd_symbol  = "[${nixos}](bold green)";       # modo normal de vi
              };

              nix_shell.symbol = nixCopo;                        # dentro de nix develop / direnv

              status = {
                disabled = false;
                symbol = "✗";
                format = "[$symbol $status]($style) ";
                style = "bold red";
              };
            };
          */
        };

        zsh = {
          enable = true;
          enableCompletion = true;
          autosuggestions.enable = true;
          syntaxHighlighting.enable = true;
          # interactiveShellInit = "fastfetch";

          shellAliases = {
            cf = "cd ~/nixos";
            rebuild-switch = "sudo nixos-rebuild switch --flake ~/nixos#nixos";
            rebuild-boot = "sudo nixos-rebuild boot --flake ~/nixos#nixos";
          };

          ohMyZsh = {
            enable = true;
            plugins = [
              "git"
              "sudo"
            ];
          };
        };
      };

      environment.systemPackages = with pkgs; [
        kitty
        fzf
        fastfetch
        btop
      ];
    };
}
