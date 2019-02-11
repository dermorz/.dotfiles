alias ap='pwd; echo "Continue?"; read; ansible-playbook -i inventory -D'
alias av='ansible-vault'
alias kl='kubelogin --username moritz.pein --password $(pass ldap | head -1)'
alias vim=nvim
alias e=nvim
alias gl="git log --graph --pretty='%C(auto)%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias j="open $JIRA_URL/issue/$(git rev-parse --abbrev-ref HEAD | sed 's/.*\/\([A-Z]*-[0-9]*\).*/\1/')"
