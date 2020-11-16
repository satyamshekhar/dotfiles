# Color key:
#   #ffffff Background
#   #efefef Current Line
#   #d6d6d6 Selection
#   #4d4d4c Foreground
#   #8e908c Comment
#   #c82829 Red
#   #f5871f Orange
#   #eab700 Yellow
#   #718c00 Green
#   #3e999f Aqua
#   #afd6fd Light blue
#   #4271ae Blue
#   #8959a8 Purple

## set status bar
set -g status-style bg="#605ead"
setw -g window-status-current-style bg="#ffffff"
setw -g window-status-current-style fg="#ffffff"

## highlight active window
# # setw -g window-style 'bg=#efefef'
# setw -g window-style 'bg=#ffffff'
# setw -g window-active-style 'bg=#ffffff'
# setw -g pane-active-border-style ''

## highlight activity in status bar
setw -g window-status-activity-style fg="#3e999f"
setw -g window-status-activity-style bg="#ffffff"

set -g clock-mode-colour "#4271ae"
set -g clock-mode-style 12

set -g message-style bg="#3e999f"
set -g message-style fg="#000000"

set -g message-command-style bg="#3e999f"
set -g message-command-style fg="#000000"

# message bar or "prompt"
set -g message-style bg="#2d2d2d"
set -g message-style fg="#cc99cc"

# right side of status bar holds "[host name] (date time)"
set -g status-right-length 100
set -g status-right-style fg=black
set -g status-right-style bold
set -g status-right '#[fg=#efefef,bg=#2d2d2d] %m.%d #[fg=#f99157]%H:%M '

# make background window look like white tab
set-window-option -g window-status-style bg=default
set-window-option -g window-status-style fg=white
set-window-option -g window-status-style none
set-window-option -g status-left "#[fg=#efefef] #S #[default]"
set-window-option -g window-status-format '#[fg=#ffffff,bg=colour235] #I#[fg=#999999,bg=#2d2d2d] #W #[default]'
set-window-option -g window-status-separator ' '

# make foreground window look like bold yellow foreground tab
set-window-option -g window-status-current-style none
set-window-option -g window-status-current-format '#[fg=#f99157,bg=#2d2d2d] #I#[fg=#f99157,bg=#393939] #W #[default]'
