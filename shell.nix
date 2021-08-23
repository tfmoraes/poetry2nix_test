let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};
  poetry2nix = import sources.poetry2nix {
    inherit pkgs;
    poetry = pkgs.poetry;
  };
  myAppEnv = poetry2nix.mkPoetryEnv {
    projectDir = ./.;
    preferWheels = true;
    python = pkgs.python38;
  };
in myAppEnv.env
