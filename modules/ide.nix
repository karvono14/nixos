{ inputs, ... }:
{
  flake.modules.nixos.ide = { pkgs, config, ... }: {

    programs.neovim = {
      enable = true;
      # defaultEditor = true;
      # viAlias = true;
      # vimAlias = true;
    };
    home-manager.users.karvono14 = { config, ... }: {
      programs.helix = {
        enable = true;
        # defaultEditor = true;
        settings = {
          theme = "tokyonight_transparent";
          editor = {
            line-number = "relative";
            mouse = true;
            cursor-shape = {
              insert = "bar";
              normal = "block";
              select = "underline";
            };
            file-picker = {
              hidden = false;
            };
          };
          keys.normal = {
            space.space = "file_picker";
            esc = [ "collapse_selection" "keep_primary_selection" ];
          };
        };

        themes.monokai_transparent = {
          inherits = "monokai";
          "ui.background" = { };
        };

        themes.tokyonight_transparent = {
          inherits = "tokyonight";
          "ui.background" = { };
        };

                  
        # Configuración de lenguajes (languages.toml)
        languages = {
          language = [
            # nix ===================================
            {
              name = "nix";
              auto-format = false;
              formatter = {
                command = "${pkgs.nixfmt}/bin/nixfmt";
              };
            }
            # python ===================================
            {
              name = "python";
              auto-format = false;
              language-servers = [ "pyright" ];
              formatter = {
                command = "${pkgs.ruff}/bin/ruff";
                args = [
                  "format"
                  "-"
                ];
              };
            }
            # C ===================================
            {
              name = "c";
              auto-format = false;
              language-servers = [ "clangd" ];
            }
          ];
        };

        # Paquetes adicionales necesarios para tus lenguajes (LSP, formatters)
        extraPackages = with pkgs; [
          nil # LSP para Nix
          marksman # LSP para Markdown
          typescript-language-server
          pyright
          ruff
          clang-tools
          cmake
        ];

      };
    
    };

    environment.variables = {
      SUDO_EDITOR = "hx";
      EDITOR = "hx";
      VISUAL = "hx";
    };
    environment.shellAliases = {
      h = "hx";
      hs = "sudo -e";
      vis = "sudo vim";
    };
  };
}
