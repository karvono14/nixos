{ inputs, ... }:
{
  flake.modules.nixos.dev = { pkgs, config, ... }: {

    programs.git.enable = true;
    programs.neovim = {
      enable = true;
      # defaultEditor = true;
      # viAlias = true;
      # vimAlias = true;
    };
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

    home-manager.users.karvono14 = { config, ... }: {

      xdg.configFile."matugen/templates/helix.toml".text = ''

        # --- Sintaxis ---
        "keyword"                  = "magenta"
        "keyword.control"          = { fg = "magenta", modifiers = ["italic"] }
        "keyword.operator"         = "bright_cyan"
        "keyword.function"         = "magenta"
        "keyword.storage"          = "magenta"
        "keyword.directive"        = "cyan"
        "operator"                 = "bright_cyan"
        "function"                 = "blue"
        "function.method"          = "blue"
        "function.builtin"         = "cyan"
        "function.macro"           = "cyan"
        "type"                     = "cyan"
        "type.builtin"             = "cyan"
        "constructor"              = "cyan"
        "namespace"                = "cyan"
        "constant"                 = "bright_yellow"
        "constant.builtin"         = "bright_yellow"
        "constant.numeric"         = "bright_yellow"
        "constant.character"       = "green"
        "constant.character.escape" = "magenta"
        "string"                   = "green"
        "string.regexp"            = "bright_cyan"
        "string.special"           = "magenta"
        "variable"                 = "fg"
        "variable.builtin"         = "red"
        "variable.parameter"       = "yellow"
        "variable.other.member"    = "bright_green"
        "attribute"                = "yellow"
        "tag"                      = "red"
        "label"                    = "blue"
        "special"                  = "blue"
        "punctuation"              = "fg_dim"
        "punctuation.delimiter"    = "fg_dim"
        "punctuation.bracket"      = "fg_dim"
        "comment"                  = { fg = "grey", modifiers = ["italic"] }

        # --- Markdown y diff ---
        "markup.heading"           = { fg = "blue", modifiers = ["bold"] }
        "markup.bold"              = { modifiers = ["bold"] }
        "markup.italic"            = { modifiers = ["italic"] }
        "markup.strikethrough"     = { modifiers = ["crossed_out"] }
        "markup.link.url"          = { fg = "cyan", modifiers = ["underlined"] }
        "markup.link.text"         = "blue"
        "markup.raw"               = "green"
        "markup.quote"             = "grey"
        "markup.list"              = "red"
        "diff.plus"                = "green"
        "diff.minus"               = "red"
        "diff.delta"               = "yellow"

        # --- Interfaz ---
        "ui.background"            = {}
        "ui.text"                  = "fg"
        "ui.text.focus"            = { bg = "selection", modifiers = ["bold"] }
        "ui.text.inactive"         = "fg_dim"
        "ui.linenr"                = "outline"
        "ui.linenr.selected"       = { fg = "primary", modifiers = ["bold"] }
        "ui.cursorline.primary"    = { bg = "cursorline" }
        "ui.selection"             = { bg = "selection" }
        "ui.selection.primary"     = { bg = "selection" }
        "ui.cursor"                = { fg = "on_primary", bg = "primary" }
        "ui.cursor.insert"         = { fg = "on_primary", bg = "green" }
        "ui.cursor.select"         = { fg = "on_primary", bg = "yellow" }
        "ui.cursor.match"          = { bg = "selection", modifiers = ["bold"] }
        "ui.statusline"            = { fg = "fg", bg = "bg_float" }
        "ui.statusline.inactive"   = { fg = "fg_dim", bg = "bg_float" }
        "ui.statusline.normal"     = { fg = "on_primary", bg = "primary", modifiers = ["bold"] }
        "ui.statusline.insert"     = { fg = "on_primary", bg = "green", modifiers = ["bold"] }
        "ui.statusline.select"     = { fg = "on_primary", bg = "yellow", modifiers = ["bold"] }
        "ui.popup"                 = { fg = "fg", bg = "bg_float" }
        "ui.help"                  = { fg = "fg", bg = "bg_float" }
        "ui.menu"                  = { fg = "fg", bg = "bg_float" }
        "ui.menu.selected"         = { fg = "fg", bg = "selection", modifiers = ["bold"] }
        "ui.window"                = { fg = "outline" }
        "ui.virtual.whitespace"    = "outline_dim"
        "ui.virtual.indent-guide"  = "outline_dim"
        "ui.virtual.ruler"         = { bg = "cursorline" }
        "ui.virtual.inlay-hint"    = { fg = "grey", modifiers = ["italic"] }
        "ui.bufferline"            = { fg = "fg_dim", bg = "bg_float" }
        "ui.bufferline.active"     = { fg = "primary", bg = "cursorline", modifiers = ["bold"] }

        # --- Diagnósticos ---
        "error"                    = "red"
        "warning"                  = "yellow"
        "info"                     = "cyan"
        "hint"                     = "green"
        "diagnostic.error"         = { underline = { color = "red", style = "curl" } }
        "diagnostic.warning"       = { underline = { color = "yellow", style = "curl" } }
        "diagnostic.info"          = { underline = { color = "cyan", style = "curl" } }
        "diagnostic.hint"          = { underline = { color = "green", style = "curl" } }
        "diagnostic.unnecessary"   = { modifiers = ["dim"] }

        [palette]
        bg          = "{{colors.surface.default.hex}}"
        bg_float    = "{{colors.surface_container.default.hex}}"
        cursorline  = "{{colors.surface_container_low.default.hex}}"
        selection   = "{{colors.secondary_container.default.hex}}"
        fg          = "{{colors.on_surface.default.hex}}"
        fg_dim      = "{{colors.on_surface_variant.default.hex}}"
        outline     = "{{colors.outline.default.hex}}"
        outline_dim = "{{colors.outline_variant.default.hex}}"
        primary     = "{{colors.primary.default.hex}}"
        on_primary  = "{{colors.on_primary.default.hex}}"

        red            = "{{dank16.color1.default.hex}}"
        green          = "{{dank16.color2.default.hex}}"
        yellow         = "{{dank16.color3.default.hex}}"
        blue           = "{{dank16.color4.default.hex}}"
        magenta        = "{{dank16.color5.default.hex}}"
        cyan           = "{{dank16.color6.default.hex}}"
        grey           = "{{dank16.color8.default.hex}}"
        bright_green   = "{{dank16.color10.default.hex}}"
        bright_yellow  = "{{dank16.color11.default.hex}}"
        bright_cyan    = "{{dank16.color14.default.hex}}"

      '';

      xdg.configFile."matugen/config.toml".text = ''
        [config]

        [templates.helix]
        input_path = '${config.xdg.configHome}/matugen/templates/helix.toml'
        output_path = '${config.xdg.configHome}/helix/themes/dank.toml'
      '';

      programs = {

        helix = {
          enable = true;
          # defaultEditor = true;
          settings = {
            theme = "dank";
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

    virtualisation.docker = {
      enable = true;
      enableOnBoot = false;
    };

    environment.systemPackages = with pkgs; [
      devenv
      glow
      vscode
      jq
      gh
      github-desktop
      # inputs.yazelix.packages.${pkgs.stdenv.hostPlatform.system}.yazelix # <-- el ultimo atributo es el nombre del archivo en el repo
    ];
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
