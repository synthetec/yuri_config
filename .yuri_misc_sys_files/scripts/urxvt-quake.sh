#!/bin/bash

# toggles a tilda/guake/yakuake-like urxvt window
# requires wmctrl, openbox, and custom .config/openbox/rc.xml settings

# grab the window ID of the urxvt-quake terminal window
WINID=`wmctrl -lx | grep urxvt-quake.URxvt | awk '{ print $1 }'`

# if no existing window, start the terminal
if [ -z "$WINID" ]; then
  urxvt -geometry 80x20 -name urxvt-quake &
else # toggle hidden
  wmctrl -i -r $WINID -b toggle,hidden
  # if window is visible, activate it
  if [ -z `xprop -id $WINID | grep HIDDEN` ]; then
    wmctrl -i -a $WINID
  fi
fi

