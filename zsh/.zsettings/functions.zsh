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

kns () {
  local ns=$(kubectl get namespace | fzf | awk '{print $1}')
  local current=$(kubectl config current-context)
  kubectl config set-context "${current}" --namespace="${ns}"
}

pw () {
  local entry=$(pass | fzf | awk '{print $2}')
  [ -z "$entry" ] || pass -c "${entry}"
}

ppw () {
  local entry=$(ppass | fzf | awk '{print $2}')
  [ -z "$entry" ] || ppass -c "${entry}"
}
