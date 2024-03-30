For using ansible:
- Each node must be accessible (by ssh or any other means).
- authentication must be secure (Here I have used password auth. which is unsecure).
- Users of each host must have sudo previleage without password. (I have used shesh as user).
- kubernetes should be installed on each host and cluster should be already set up.
- to run ansible-playbook use "ansible-playbook -i inventory.ini --vault-password-file ./ansible/.secret -vv ./ansible/deploy.yaml".
