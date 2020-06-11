#
echo "Install ansible"

# change if you use ubuntu/debian
# sudo apt update && sudo apt install ansible
brew install ansible 

#
echo "Add inventory file"

touch ~/.ansible/hosts

echo "Update .zshrc file"

echo "export ANSIBLE_HOSTS=~/.ansible/hosts" >> ~/.zshrc
# echo "export ANSIBLE_HOSTS=~/.ansible/hosts" >> ~/.bashrc

#
ansible --version