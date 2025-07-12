function gop
    # Get current branch
    set branch (git rev-parse --abbrev-ref HEAD)

    # Get remote URL
    set remote_url (git config --get remote.origin.url)

    # Parse owner and repo from remote URL (handles SSH and HTTPS)
    if string match -r 'github.com[:/]' -- $remote_url
        # Remove .git at the end if present
        set remote_url (string replace -r '\\.git$' '' -- $remote_url)
        # Remove protocol and domain
        set path (string replace -r '.*github.com[:/]' '' -- $remote_url)
        # Split into owner and repo
        set owner (string split '/' $path)[1]
        set repo (string split '/' $path)[2]
        set pr_url "https://github.com/$owner/$repo/pull/new/$branch"
        open $pr_url
    else
        echo "Remote is not a GitHub repository."
    end
end 