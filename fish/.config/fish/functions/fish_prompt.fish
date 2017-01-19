function fish_prompt
    # 'fish_mode_prompt' may prepend some information to the prompt.

    # Remote connection.
    if test $SSH_TTY
        set -l r_user (set_color red)(whoami)
        set -l r_host (set_color yellow)(hostname)
        echo -n $r_user(set_color white)"@"$r_host" "
    end

    # Current dir.
    test -w (pwd); and set -l color cyan; or set -l color yellow
    echo -n (set_color $color)(prompt_pwd)" "

    # Git information.
    echo -n (__fish_git_prompt "[%s]")" "

    # Key bindinds mode.
    ## Set style for default/vi keybindings.
    set -l key_mode (set_color red)"❯"(set_color yellow)"❯"(set_color green)"❯"

    ## Check different modes for vi keybings.
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        switch $fish_bind_mode
            case default
                set key_mode (set_color green)"❮"(set_color yellow)"❮"(set_color red)"❮"
            case replace-one
                set key_mode (set_color yellow)"❮❮❮"
            case visual
                set key_mode (set_color red)"❮❮❮"
        end
    end
    echo -n $key_mode

    # User.
    test $USER = "root"; and echo -n (set_color red)"#"

    echo -n (set_color normal)" "
end
