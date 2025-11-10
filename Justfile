local:
    ansible-playbook -K ./playbooks/local.yml

remote:
    ansible-playbook -K ./playbooks/remote.yml

debug:
    ansible-playbook ./playbooks/debug.yml

alma:
    ansible-playbook -K ./playbooks/alma.ymg

ssh_keys:
    scp ~/.ssh/git* flevin58@alma:~/.ssh
    scp ~/.ssh/git* flevin58@MacMini.local:~/.ssh
