{
  config,
  pkgs,
  ...
}: {
  services.xserver.resolutions = [
    {
      x = 1600;
      y = 900;
    }
  ];
}
