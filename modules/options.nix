{ lib, ... }:
{
  options.matrixSite = {
    domain = lib.mkOption {
      type = lib.types.str;
      default = "matrix.skxxtz.de";
    };

    conduitPort = lib.mkOption {
      type = lib.types.port;
      default = 6167;
    };
  };
}
