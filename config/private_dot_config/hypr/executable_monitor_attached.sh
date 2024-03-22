#!/usr/bin/env bash
set -eou pipefail

hyprctl keyword monitor HDMI-A-1,3440x1440,auto,auto
hyprctl keyword monitor HDMI-A-4,3440x1440,auto,auto

hyprctl keyword monitor eDP-1,disable
