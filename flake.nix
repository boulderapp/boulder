{
  description = "Ruby on Rails development environment";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nix-filter.url = "github:numtide/nix-filter";
  };

  outputs = { self, nixpkgs, flake-utils, nix-filter }:
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
      let
        pkgs = import nixpkgs { inherit system; };

        rubyEnv = pkgs.bundlerEnv {
          # The full app environment with dependencies
          name = "rails-env";
          ruby = pkgs.ruby_3_1;
          gemdir = ./backend; # Points to Gemfile.lock and gemset.nix
        };

        updateRubyDeps = pkgs.writeScriptBin "update-ruby-deps" (builtins.readFile
          (pkgs.substituteAll {
            src = ./backend/scripts/update.sh;
            bundix = "${pkgs.bundix}/bin/bundix";
            bundler = "${rubyEnv.bundler}/bin/bundler";
          }));
      in
      {
        checks = {
          inherit rubyEnv;
        };
        devShells = rec {
          default = run;

          run = pkgs.mkShell {
            buildInputs = [
              rubyEnv
              rubyEnv.wrappedRuby
              updateRubyDeps
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
