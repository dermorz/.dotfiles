tunnel-anything () {
  ssh -M -S /tmp/tunnel-anything-1337 -fnNT -L "1337:localhost:$1" "$2"
  vared -p "Tunnel is to '$2' open, on 1337->$1 (enter to stop)" -c tmp
  ssh -S /tmp/tunnel-anything-1337 -O exit "$2"
}

delete-merged-branches () {
  for branch in $(git branch --merged | grep -v -E 'master|develop')
  do
    git branch -d $branch
  done
}

commit_prefix () {
  SLUG=$(git rev-parse --abbrev-ref HEAD | sed 's/.*\/\([[:upper:]]*-[[:digit:]]*\).*/\1/')
  echo "$1[$SLUG]:"
}

commit () {
  git commit -v -e -m "$(commit_prefix $1) $2"
}

kubeclear () {
  kubectl delete deploy,statefulset,configmap,secret,svc,etcd,jobs,po,pvc --all
}

j () {
  slug="(git rev-parse --abbrev-ref HEAD | sed 's/.*\/\([A-Z]*-[0-9]*\).*/\1/')"
  open "$JIRA_URL/browse/$slug"
}

xdump () {
  for dump in "$@"
  do
    gpg -d $dump 2>/dev/null | tar xz - "*.request.json" "*.response.json" && rm -f $dump
  done
}
