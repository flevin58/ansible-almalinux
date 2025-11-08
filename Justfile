this:
    ansible-playbook -K ./playbooks/M4-Nando.yml

mac:
    ansible-playbook -vvv -K ./playbooks/MacMini.yml

alma:
    ansible-playbook -K ./playbooks/AlmaLinux.yml

debug:
    ansible-playbook -K ./playbooks/debug_local.yml
