{
  description = "Ruby on Rails development environment";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nix-filter.url = "github:numtide/nix-filter";
  };

  outputs = { self, nixpkgs, flake-utils, nix-filter }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        rubyEnv = pkgs.bundlerEnv {
          # The full app environment with dependencies
          name = "rails-env";
          ruby = pkgs.ruby_3_1;
          gemdir = ./.; # Points to Gemfile.lock and gemset.nix
        };

        updateDeps = pkgs.writeScriptBin "update-deps" (builtins.readFile
          (pkgs.substituteAll {
            src = ./scripts/update.sh;
            bundix = "${pkgs.bundix}/bin/bundix";
            bundler = "${rubyEnv.bundler}/bin/bundler";
          }));

        tailwindcss = pkgs.nodePackages.tailwindcss.overrideAttrs (_: {
          plugins = [
            pkgs.nodePackages."@tailwindcss/aspect-ratio"
            pkgs.nodePackages."@tailwindcss/forms"
            pkgs.nodePackages."@tailwindcss/typography"
          ];
        });

        runTailwind = pkgs.writeScriptBin "run-tailwind" ''
          ${tailwindcss}/bin/tailwindcss \
            -i app/assets/stylesheets/application.tailwind.css \
            -o app/assets/builds/tailwind.css \
            -c config/tailwind.config.js \
            "''$@"
        '';
      in
      {
        devShells = rec {
          default = run;

          run = pkgs.mkShell {
            buildInputs = [
              tailwindcss
              rubyEnv
              rubyEnv.wrappedRuby
              updateDeps
              # runTailwind
              pkgs.bundix
              pkgs.yarn
              pkgs.nodePackages.typescript
            ];

            shellHook = ''
              ${rubyEnv}/bin/rails --version
            '';
          };
        };

        packages = {
          default = rubyEnv;
        };
      });
}
