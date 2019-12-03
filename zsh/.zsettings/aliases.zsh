alias ap='pwd; echo "Continue?"; read; ansible-playbook -i inventory -D'
alias av='ansible-vault'
alias vim='nvim -O'
alias e='nvim -O'
alias gl="git log --graph --pretty='%C(auto)%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias -g G='|grep '

alias ppass="PASSWORD_STORE_DIR=~/.ppass pass"

alias k='kubectl'
alias ka='kubectl apply -f'
alias kcc='kubectl config use-context'
alias kd='kubectl describe'
alias kg='kubectl get'
alias kga='kubectl get pods,services,deployments,statefulsets'
alias kgaw='watch -n1 -t kubectl get pods,services,deployments,statefulsets'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kl='kubectl logs'
alias klf='kubectl logs -f --tail=10'
alias kpf='kubectl port-forward'
alias kx='kubectl exec -it'

alias klo='kubelogin --username moritz.pein --password $(pass figo-ldap | head -1)'
alias klop='klo --prod'
