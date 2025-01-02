{ ... }:

{
  services.nginx = {
    enable = true;
    virtualHosts."atlasworld.fr" = {
      enableACME = false;
      forceSSL = false;
      root = "/var/www/atlasworld.fr";
    };
  };
}
