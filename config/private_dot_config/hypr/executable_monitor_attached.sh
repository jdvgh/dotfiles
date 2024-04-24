#!/usr/bin/env bash
set -eou pipefail

# hyprctl keyword monitor HDMI-A-1,3440x1440,auto,auto
hyprctl keyword monitor HDMI-A-5,3440x1440,auto,auto
# hyprctl keyword monitor HDMI-A-5,1920x1080,auto,auto

hyprctl keyword monitor eDP-1,disable
