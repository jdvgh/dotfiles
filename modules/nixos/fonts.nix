{ config, pkgs, ... }: {
  ### Fonts ================================================================
  fonts = {
    fontconfig = {
      enable = true;
      allowBitmaps = false;
      defaultFonts = {
        serif = [ "NotoSerif Nerd Font" ];
        sansSerif = [ "NotoSans Nerd Font" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
    fontDir.enable = true;

    packages = with pkgs; [
      corefonts
      ubuntu_font_family
      fira
      noto-fonts
      noto-fonts-emoji
      google-fonts
      (nerdfonts.override {
        fonts = [ "FiraCode" "Noto" "JetBrainsMono" "SourceCodePro" ];
      })
    ];
  };

  environment.systemPackages = with pkgs; [ font-manager ];

  # ===========================================================================
}
