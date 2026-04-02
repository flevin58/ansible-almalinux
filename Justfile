local:
    ansible-playbook -K ./playbooks/local.yml

remote:
    ansible-playbook -K ./playbooks/remote.yml

debug:
    ansible-playbook ./playbooks/debug.yml

m1:
    ansible-playbook ./playbooks/m1.yml

ssh_keys:
    scp ~/.ssh/git* flevin58@alma:~/.ssh
    scp ~/.ssh/git* flevin58@MacMini.local:~/.ssh
