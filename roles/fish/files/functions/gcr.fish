function gcr
  set -l branch (git branch --show-current)
  set -l elements (string split "-" $branch)
  set -l taskid (string join "-" $elements[1] $elements[2])
  echo $taskid
  git add -A
  git commit -m $taskid
  gr
end

