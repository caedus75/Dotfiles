#
# Fish Environment
#

# Disable greeting
set fish_greeting ""

# Set vi key bindings
set -g fish_key_bindings fish_vi_key_bindings

# Cursor shape
# values are 'block', 'line' or 'underscore'
if status is-interactive
    set -U fish_cursor_default line
    set -U fish_cursor_insert line
    set -U fish_cursor_visual line
end

# SSH & GPG-agent
set -x SSH_AUTH_SOCK /run/user/(id -u $USER)/gnupg/S.gpg-agent.ssh

function _gpg-agent_env --on-event fish_preexec
    if pgrep gpg-agent >/dev/null
        set -x GPG_TTY (tty)
        gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1
    end
end

# Pager
set -x PAGER less
set -x LESSHISTFILE -

# Editor
set -x EDITOR vim
set -x VISUAL $EDITOR

# Path
# A faster way is to modify the $fish_user_paths universal variable, which is
# automatically prepended to $PATH.
# Just run this once at the command line, and it will affect the current
# session and all future instances too.
# (Note: you should NOT add this line to config.fish. If you do, the variable
# will get longer each time you run fish!)
# To permanently add ~/.local/bin to your $PATH, you could write:
#   $ set -U fish_user_paths $HOME/.local/bin $fish_user_paths

# Go Path
if test -d $HOME/.local/go
    set -x GOPATH $HOME/.local/go
end


#
# Fish git prompt
#

# Settings
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate yes
set __fish_git_prompt_showuntrackedfiles yes
set __fish_git_prompt_showupstream informative
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status chars
set __fish_git_prompt_char_stateseparator "|"
set __fish_git_prompt_char_stagedstate (set_color green)"*"(set_color normal)
set __fish_git_prompt_char_dirtystate (set_color yellow)"*"(set_color normal)
set __fish_git_prompt_char_untrackedfiles (set_color red)"*"(set_color normal)
set __fish_git_prompt_char_stashstate (set_color blue)"*"(set_color normal)
set __fish_git_prompt_char_upstream_ahead (set_color green)"+"(set_color normal)
set __fish_git_prompt_char_upstream_behind (set_color red)"-"(set_color normal)
