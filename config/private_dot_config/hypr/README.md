To create the image use [nix-wallpaper](https://github.com/lunik1/nix-wallpaper)
```
nix build --impure --expr '(builtins.getFlake "github:lunik1/nix-wallpaper").packages.${builtins.currentSystem}.default.override { preset = "solarized-light-rainbow"; }'
```

and then
```
sudo cp result/share/wallpapers/nixos-wallpaper.png ~/.config/hypr/
```

