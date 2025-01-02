{ lib, pkgs, inputs, ... }:

{
  imports = [
    ./shell.nix
    ./ssh.nix

    ./web/nginx.nix
  ];

  # Misc
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
