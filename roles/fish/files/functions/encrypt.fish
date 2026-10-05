function encrypt --description "Encrypts files using an age recipients config file or key"
    # CLI options
    set -l options (fish_opt -s r -l rm)
    set -a options (fish_opt -s n -l dry-run)
    set -a options (fish_opt -s h -l help)

    if not argparse $options -- $argv
        return 1
    end

    if set -q _flag_help
        echo "Usage: encrypt [-r|--rm] [-n|--dry-run] <file...> OR find ... | encrypt"
        echo ""
        echo "Options:"
        echo "  -r, --rm       Remove plaintext file after successful encryption"
        echo "  -n, --dry-run  Print actions without modifying or creating files"
        echo "  -h, --help     Show this help message"
        return 0
    end

    # Determine recipient source: config file takes precedence, fallback to env variable
    set -l default_recipients_file "$HOME/.config/age/recipients.txt"
    set -l age_flag

    if test -f "$default_recipients_file"
        set age_flag -R "$default_recipients_file"
    else if set -q AGE_RECIPIENT; and test -n "$AGE_RECIPIENT"
        set age_flag -r "$AGE_RECIPIENT"
    else
        echo "Error: No recipient configured." >&2
        echo "Create '~/.config/age/recipients.txt' with your 'age1...' public key." >&2
        return 1
    end

    # Collect files from arguments or stdin
    set -l files
    if test (count $argv) -gt 0
        set files $argv
    else if not isatty stdin
        while read -l line
            test -n "$line"; and set -a files "$line"
        end
    end

    if test (count $files) -eq 0
        echo "Usage: encrypt [-r|--rm] [-n|--dry-run] <file...> OR find ... | encrypt" >&2
        return 1
    end

    set -l success_count 0
    set -l fail_count 0

    for input_file in $files
        if not test -f "$input_file"
            echo "Skipping: '$input_file' not found or is a directory." >&2
            set fail_count (math $fail_count + 1)
            continue
        end

        if string match -q "*.age" "$input_file"
            echo "Skipping: '$input_file' already ends in .age." >&2
            set fail_count (math $fail_count + 1)
            continue
        end

        set -l output_file "$input_file.age"

        if test -e "$output_file"
            echo "Skipping: Target '$output_file' already exists." >&2
            set fail_count (math $fail_count + 1)
            continue
        end

        if set -q _flag_dry_run
            if set -q _flag_rm
                echo "[dry-run] age $age_flag -o '$output_file' '$input_file' && rm '$input_file'"
            else
                echo "[dry-run] age $age_flag -o '$output_file' '$input_file'"
            end
            set success_count (math $success_count + 1)
            continue
        end

        age $age_flag -o "$output_file" "$input_file" 2>/dev/null
        if test $status -eq 0
            if set -q _flag_rm
                rm -f "$input_file"
                echo "Encrypted & removed original: $output_file"
            else
                echo "Encrypted: $output_file"
            end
            set success_count (math $success_count + 1)
        else
            test -f "$output_file"; and rm -f "$output_file"
            echo "Failed to encrypt: $input_file" >&2
            set fail_count (math $fail_count + 1)
        end
    end

    echo "Done: $success_count processed, $fail_count skipped/failed."
end
