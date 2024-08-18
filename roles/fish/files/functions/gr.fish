function gr
  set -l branch (git branch --show-current)
  set -l elements (string split "-" $branch)
  set -l taskid (string join "-" $elements[1] $elements[2])
  echo $taskid
  set -l commitsShas (git log --oneline --pretty=format:"%h" -n 5 --invert-grep --grep=$taskid)
  echo $commitsShas[1]
  echo $commitsShas
  git rebase -i $commitsShas[1]
end

