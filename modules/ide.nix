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

      programs = {
        helix = {
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
              esc = [
                "collapse_selection"
                "keep_primary_selection"
              ];
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

          themes.terminal = {
            # --- Sintaxis (mismos roles que ves en bat) ---
            "keyword" = "red";
            "keyword.control" = {
              fg = "red";
              modifiers = [ "italic" ];
            };
            "keyword.operator" = "red";
            "keyword.directive" = "red";
            "operator" = "red";
            "function" = "green";
            "function.method" = "green";
            "function.builtin" = "cyan";
            "function.macro" = "cyan";
            "type" = "cyan";
            "type.builtin" = "cyan";
            "constructor" = "cyan";
            "namespace" = "cyan";
            "constant" = "magenta";
            "constant.builtin" = "magenta";
            "constant.numeric" = "magenta";
            "constant.character.escape" = "magenta";
            "string" = "yellow";
            "string.regexp" = "light-yellow";
            "variable" = "default";
            "variable.parameter" = {
              fg = "light-yellow";
              modifiers = [ "italic" ];
            };
            "variable.builtin" = "magenta";
            "variable.other.member" = "green";
            "attribute" = "green";
            "tag" = "red";
            "label" = "green";
            "special" = "cyan";
            "punctuation" = "default";
            "comment" = {
              fg = "gray";
              modifiers = [ "italic" ];
            };

            # --- Markdown y diff ---
            "markup.heading" = {
              fg = "blue";
              modifiers = [ "bold" ];
            };
            "markup.bold" = {
              modifiers = [ "bold" ];
            };
            "markup.italic" = {
              modifiers = [ "italic" ];
            };
            "markup.link.url" = {
              fg = "cyan";
              modifiers = [ "underlined" ];
            };
            "markup.link.text" = "blue";
            "markup.raw" = "green";
            "markup.quote" = "gray";
            "markup.list" = "red";
            "diff.plus" = "green";
            "diff.minus" = "red";
            "diff.delta" = "yellow";

            # --- Interfaz ---
            "ui.background" = { };
            "ui.text" = "default";
            "ui.linenr" = "gray";
            "ui.linenr.selected" = {
              fg = "yellow";
              modifiers = [ "bold" ];
            };
            "ui.cursorline.primary" = {
              bg = "black";
            };
            "ui.selection" = {
              bg = "gray";
            };
            "ui.cursor" = {
              modifiers = [ "reversed" ];
            };
            "ui.cursor.match" = {
              fg = "yellow";
              modifiers = [
                "bold"
                "underlined"
              ];
            };
            "ui.statusline" = {
              fg = "default";
              bg = "black";
            };
            "ui.statusline.inactive" = {
              fg = "gray";
              bg = "black";
            };
            "ui.statusline.normal" = {
              fg = "black";
              bg = "blue";
              modifiers = [ "bold" ];
            };
            "ui.statusline.insert" = {
              fg = "black";
              bg = "green";
              modifiers = [ "bold" ];
            };
            "ui.statusline.select" = {
              fg = "black";
              bg = "yellow";
              modifiers = [ "bold" ];
            };
            "ui.popup" = {
              fg = "default";
              bg = "black";
            };
            "ui.help" = {
              fg = "default";
              bg = "black";
            };
            "ui.menu" = {
              fg = "default";
              bg = "black";
            };
            "ui.menu.selected" = {
              fg = "black";
              bg = "blue";
            };
            "ui.window" = {
              fg = "gray";
            };
            "ui.virtual.whitespace" = "gray";
            "ui.virtual.indent-guide" = "gray";
            "ui.virtual.inlay-hint" = {
              fg = "gray";
              modifiers = [ "italic" ];
            };

            # --- Diagnósticos ---
            "error" = "red";
            "warning" = "yellow";
            "info" = "cyan";
            "hint" = "green";
            "diagnostic.error" = {
              underline = {
                color = "red";
                style = "curl";
              };
            };
            "diagnostic.warning" = {
              underline = {
                color = "yellow";
                style = "curl";
              };
            };
            "diagnostic.info" = {
              underline = {
                color = "cyan";
                style = "curl";
              };
            };
            "diagnostic.hint" = {
              underline = {
                color = "green";
                style = "curl";
              };
            };
            "diagnostic.unnecessary" = {
              modifiers = [ "dim" ];
            };
          };

          themes.extracted = {
            # --- Sintaxis ---
            "keyword" = "primary";
            "keyword.control" = {
              fg = "primary";
              modifiers = [ "italic" ];
            };
            "keyword.operator" = "secondary";
            "operator" = "secondary";
            "function" = "inf";
            "function.builtin" = "tertiary";
            "function.macro" = "tertiary";
            "type" = "tertiary";
            "type.builtin" = "tertiary";
            "constructor" = "tertiary";
            "namespace" = "secondary";
            "constant" = "warn";
            "constant.numeric" = "warn";
            "constant.builtin" = "warn";
            "constant.character.escape" = "primary";
            "string" = "ok";
            "string.regexp" = "secondary";
            "variable" = "fg";
            "variable.builtin" = "err";
            "variable.parameter" = "secondary";
            "variable.other.member" = "fg";
            "attribute" = "tertiary";
            "tag" = "err";
            "label" = "inf";
            "special" = "inf";
            "punctuation" = "fg_dim";
            "comment" = {
              fg = "outline";
              modifiers = [ "italic" ];
            };

            # --- Markdown y diff ---
            "markup.heading" = {
              fg = "primary";
              modifiers = [ "bold" ];
            };
            "markup.bold" = {
              modifiers = [ "bold" ];
            };
            "markup.italic" = {
              modifiers = [ "italic" ];
            };
            "markup.link.url" = {
              fg = "inf";
              modifiers = [ "underlined" ];
            };
            "markup.link.text" = "secondary";
            "markup.raw" = "ok";
            "markup.quote" = "outline";
            "markup.list" = "tertiary";
            "diff.plus" = "ok";
            "diff.minus" = "err";
            "diff.delta" = "warn";

            # --- Interfaz ---
            "ui.background" = { }; # transparente
            "ui.text" = "fg";
            "ui.text.focus" = {
              bg = "sel";
              modifiers = [ "bold" ];
            };
            "ui.linenr" = "outline_dim";
            "ui.linenr.selected" = {
              fg = "primary";
              modifiers = [ "bold" ];
            };
            "ui.cursorline.primary" = {
              bg = "cursorline";
            };
            "ui.selection" = {
              bg = "sel";
            };
            "ui.cursor" = {
              fg = "on_primary";
              bg = "primary";
            };
            "ui.cursor.insert" = {
              fg = "bg";
              bg = "ok";
            };
            "ui.cursor.select" = {
              fg = "bg";
              bg = "warn";
            };
            "ui.cursor.match" = {
              bg = "sel";
              modifiers = [ "bold" ];
            };
            "ui.statusline" = {
              fg = "fg";
              bg = "bg_float";
            };
            "ui.statusline.inactive" = {
              fg = "fg_dim";
              bg = "bg_float";
            };
            "ui.statusline.normal" = {
              fg = "on_primary";
              bg = "primary";
              modifiers = [ "bold" ];
            };
            "ui.statusline.insert" = {
              fg = "bg";
              bg = "ok";
              modifiers = [ "bold" ];
            };
            "ui.statusline.select" = {
              fg = "bg";
              bg = "warn";
              modifiers = [ "bold" ];
            };
            "ui.popup" = {
              fg = "fg";
              bg = "bg_float";
            };
            "ui.help" = {
              fg = "fg";
              bg = "bg_float";
            };
            "ui.menu" = {
              fg = "fg";
              bg = "bg_float";
            };
            "ui.menu.selected" = {
              fg = "fg";
              bg = "sel";
              modifiers = [ "bold" ];
            };
            "ui.window" = {
              fg = "outline_dim";
            };
            "ui.virtual.whitespace" = "outline_dim";
            "ui.virtual.indent-guide" = "outline_dim";
            "ui.virtual.inlay-hint" = {
              fg = "outline";
              modifiers = [ "italic" ];
            };

            # --- Diagnósticos ---
            "error" = "err";
            "warning" = "warn";
            "info" = "inf";
            "hint" = "ok";
            "diagnostic.error" = {
              underline = {
                color = "err";
                style = "curl";
              };
            };
            "diagnostic.warning" = {
              underline = {
                color = "warn";
                style = "curl";
              };
            };
            "diagnostic.info" = {
              underline = {
                color = "inf";
                style = "curl";
              };
            };
            "diagnostic.hint" = {
              underline = {
                color = "ok";
                style = "curl";
              };
            };
            "diagnostic.unnecessary" = {
              modifiers = [ "dim" ];
            };

            palette = {
              bg = "#1d1012"; # surface
              bg_float = "#2a1c1e"; # surfaceContainer
              cursorline = "#26181a"; # surfaceContainerLow
              sel = "#5a396d"; # secondaryContainer
              fg = "#f7dcdf"; # surfaceText
              fg_dim = "#e4bdc2"; # surfaceVariantText
              outline = "#ab888d"; # outline
              outline_dim = "#5c3f44"; # surfaceVariant
              primary = "#e6b4ff";
              on_primary = "#491765"; # primaryText
              secondary = "#e1b7f5";
              tertiary = "#ffb2bf";
              err = "#ffb4ab"; # error
              warn = "#FF9800"; # warning
              inf = "#2196F3"; # info
              ok = "#4CAF50"; # success
            };
          };

          # Configuración de lenguajes (languages.toml)
          languages = {
            language = [
              # nix
              {
                name = "nix";
                auto-format = true;
                formatter = {
                  command = "${pkgs.nixfmt}/bin/nixfmt";
                };
              }
              # python
              {
                name = "python";
                auto-format = true;
                language-servers = [ "pyright" ];
                formatter = {
                  command = "${pkgs.ruff}/bin/ruff";
                  args = [
                    "format"
                    "-"
                  ];
                };
              }
              # C
              {
                name = "c";
                auto-format = true;
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
