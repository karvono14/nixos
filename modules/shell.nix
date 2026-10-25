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

        fish.enable = true;

        zoxide.enable = true;

        starship = {
          enable = true;
          presets = [
            "nerd-font-symbols"
            #            "jetpack"
            "pure-preset"
          ];
          settings = {
            add_newline = false;
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

      home-manager.users.karvono14.programs = {
        kitty = {
          enable = true;

          font = {
            name = "DejaVu Sans Mono";
            size = 12;
          };

          settings = {
            enable_audio_bell = true;
            scrollback_lines = 10000;
            background_opacity = 0.9;
            window_padding_width = 12;
            copy_on_select = true;
            shellIntegration = true;
          };

          extraConfig = ''
            # Font Configuration
            # font_size 12.0

            # Window Configuration
            # window_padding_width 12
            # background_opacity 1.0
            background_blur 32
            hide_window_decorations yes

            # Cursor Configuration
            cursor_shape block
            cursor_blink_interval 1

            # Scrollback
            # scrollback_lines 3000

            # Terminal features
            # copy_on_select yes
            strip_trailing_spaces smart

            # Tab configuration
            tab_bar_style powerline
            tab_bar_align left

            # Shell integration
            shell_integration enabled

            # Dank color generation
            include dank-tabs.conf
            include dank-theme.conf
          '';
        };
      };

      environment.systemPackages = with pkgs; [
        fastfetch
        btop
      ];
    };
}
