#!/usr/bin/env bash
set -eou pipefail

hyprctl keyword monitor HDMI-A-1,3440x1440,1920x0,auto

hyprctl keyword monitor eDP-2,disable
