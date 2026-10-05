function decrypt --description "Decrypts .age files using macOS Keychain (args or pipe)"
    # Collect files from arguments or standard input
    set -l files
    if test (count $argv) -gt 0
        set files $argv
    else if not isatty stdin
        while read -l line
            test -n "$line"; and set -a files "$line"
        end
    end

    if test (count $files) -eq 0
        echo "Usage: decrypt <file1.age> [file2.age...] OR find . -name '*.age' | decrypt" >&2
        return 1
    end

    # Retrieve private key once from Keychain (triggers at most ONE prompt)
    set -l key (security find-generic-password -a "$USER" -s "age-key" -w 2>/dev/null)
    if test -z "$key"
        echo "Error: Could not retrieve 'age-key' from macOS Keychain." >&2
        return 1
    end

    # Process all files using the cached key in memory
    set -l success_count 0
    set -l fail_count 0

    for input_file in $files
        # Validate existence
        if not test -f "$input_file"
            echo "Skipping: '$input_file' not found." >&2
            set fail_count (math $fail_count + 1)
            continue
        end

        # Validate .age extension
        if not string match -q "*.age" "$input_file"
            echo "Skipping: '$input_file' does not end in .age." >&2
            set fail_count (math $fail_count + 1)
            continue
        end

        set -l output_file (string replace -r '\.age$' '' "$input_file")

        # Avoid overwriting existing decrypted files
        if test -e "$output_file"
            echo "Skipping: '$output_file' already exists." >&2
            set fail_count (math $fail_count + 1)
            continue
        end

        # Decrypt using the in-memory key
        printf "%s\n" "$key" | age -d -i - -o "$output_file" "$input_file" 2>/dev/null
        if test $status -eq 0
            echo "Decrypted: $output_file"
            set success_count (math $success_count + 1)
        else
            test -f "$output_file"; and rm -f "$output_file"
            echo "Failed to decrypt: $input_file" >&2
            set fail_count (math $fail_count + 1)
        end
    end

    echo "Done: $success_count succeeded, $fail_count skipped/failed."
end
