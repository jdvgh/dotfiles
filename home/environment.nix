{
  config,
  pkgs,
  ...
}: {
  home.sessionVariables = {
    TERMINAL = "alacritty";
    EDITOR = "nvim";
    BROWSER = "google-chrome-stable";
  };
}
