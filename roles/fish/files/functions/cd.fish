function cd --description 'Change directory'
	# Skip history in subshells
    if builtin status --is-command-substitution
        # builtin cd $argv
        z $argv
        return $status
    end

    # Avoid set completions
    set -l previous $PWD

    if test $argv[1] = -
        if test "$__fish_cd_direction" = next
            nextd
        else
            prevd
        end
        return $status
    end

    # builtin cd $argv[1]
    z $argv
    set -l cd_status $status

    if test $cd_status = 0 -a "$PWD" != "$previous"
        set -g dirprev $dirprev $previous
        set -e dirnext
        set -g __fish_cd_direction prev

        # CHANGED
        ls # because I do it anyway
    end


    return $cd_status
end
