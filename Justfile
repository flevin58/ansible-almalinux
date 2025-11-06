install:
    ansible-playbook -K -i ./inventory/hosts ./playbooks/almalinux.yml

debug:
    ansible-playbook -K -i ./inventory/hosts ./playbooks/debug.yml
