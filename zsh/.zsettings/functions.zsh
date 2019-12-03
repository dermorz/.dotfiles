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

kubeclear () {
  kubectl delete deploy,statefulset,configmap,svc,etcd,jobs,po,pvc --all
}

j () {
  slug="(git rev-parse --abbrev-ref HEAD | sed 's/.*\/\([A-Z]*-[0-9]*\).*/\1/')"
  open "$JIRA_URL/browse/$slug"
}

kexec () {
  local pod=$(kubectl get pods | fzf | awk '{print $1}')
  local containers=$(kubectl get pods "${pod}" -o jsonpath='{.spec.containers[*].name}')
  local container=${containers}
  if [[ $containers =~ ' ' ]]; then
    container=$(echo "${containers}" | tr ' ' '\n' | fzf)
  fi
  echo "${pod}" - "${container}"
  kubectl exec -it "${pod}" -c "${container}" -- "${@}"
}

klogs () {
  local pod=$(kubectl get pods | fzf | awk '{print $1}')
  local containers=$(kubectl get pods "${pod}" -o jsonpath='{.spec.containers[*].name}')
  local container=${containers}
  if [[ $containers =~ ' ' ]]; then
    container=$(echo "${containers}" | tr ' ' '\n' | fzf)
  fi
  echo "${pod}" - "${container}"
  kubectl logs "${@}" "${pod}" -c "${container}"
}

klogsf () {
  kli -f --tail=10
}

kdesc () {
  local typ=${1:-"pods"}
  local item=$(kubectl get "${typ}" | fzf | awk '{print $1}')
  kubectl describe "${typ}" "${item}"
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

1p () {
  local subdomain=${1:-"finleapconnect"}
  op list vaults &> /dev/null
  if [ "$?" -ne "0" ]
  then
    eval $(op signin "${subdomain}")
  fi
  local entry=$(op list items | jq -r '.[] | [.uuid, .overview.title] | join(":")' | fzf | cut -d':' -f1)
  local item=$(op get item $entry)
  echo $item | jq -rj '.details.fields[] | select(.type == "P") | .value' | pbcopy
  echo -n "Username: "
  echo $item | jq -r '.details.fields[] | select(.type == "T") | .value'
  echo "Copied password to clipboard. Will clear after 30 seconds."
  screen -d -m bash -c "sleep 30s && echo -n '' | pbcopy"
}
