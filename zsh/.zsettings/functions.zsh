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
  pass -c "${entry}"
}
