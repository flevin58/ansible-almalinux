local:
    ansible-playbook -K ./playbooks/local.yml

remote:
    ansible-playbook -K ./playbooks/remote.yml

debug:
    ansible-playbook -K ./playbooks/debug_local.yml

alma:
    ansible-playbook -K ./playbooks/alma.yml
