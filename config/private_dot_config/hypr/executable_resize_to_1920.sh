#!/usr/bin/env bash
set -eou pipefail
# hyprctl dispatch layoutmsg orientationcenter     # set three column master (center) layout
# hyprctl dispatch layoutmsg swapwithmaster master # set current focused window to master which goes in the center, if the window is master then next child becomes master
current_width=$(hyprctl activewindow | grep "size" | cut -f2 -d' ' | cut -f1 -d,)
hyprctl dispatch resizeactive $((1920 - current_width)) 0 # resize the now master window in the middle to 1920
