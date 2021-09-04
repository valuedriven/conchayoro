#!bin/sh

export AWS_SHARED_CREDENTIALS_FILE=ambiente/credentials
export ANSIBLE_REMOTE_USER=ec2-user
export ANSIBLE_PRIVATE_KEY_FILE=ambiente/conchayoro-key
export ANSIBLE_HOST_KEY_CHECKING=False

ansible-galaxy collection install -r ambiente/requirements.yml
ansible-playbook ambiente/keys.yml
ansible-playbook ambiente/provisioning.yml
ansible-playbook ambiente/install.yml --inventory ambiente/inventory.aws_ec2.yml