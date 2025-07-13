function gr
  set -l branch (git branch --show-current)
  echo "Current branch: $branch"

  # Get the last two commits
  set -l last_two_shas (git log --oneline --pretty=format:"%h" -n 2)
  set -l commit_to_rebase $last_two_shas[1]
  set -l target_commit $last_two_shas[2]
  set -l commit_to_rebase_msg (git log -1 --pretty=format:"%s" $commit_to_rebase)
  set -l target_commit_msg (git log -1 --pretty=format:"%s" $target_commit)

  echo "You are about to rebase (potentially squash) the last commit onto the previous one. Confirm rebase (y/n)? :"
  echo "  Commit to be rebased:   $commit_to_rebase $commit_to_rebase_msg"
  echo "  Target commit:          $target_commit $target_commit_msg"

  echo ""
  echo -n "Proceed with interactive rebase (y/n)? "
  read -l confirm
  if test "$confirm" = "y" -o "$confirm" = "Y"
    GIT_SEQUENCE_EDITOR="sed -i '' '2s/^pick /squash /'" GIT_EDITOR=true git rebase -i HEAD~2
  else
    echo "Aborted rebase."
  end
end

