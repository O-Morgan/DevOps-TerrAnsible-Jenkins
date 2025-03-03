# DevOps-TerrAnsible-Jenkins
Terraform Ansible and Jenkins 

add architectural image

add steps to Install and configure terraform

https://developer.hashicorp.com/terraform/instal

``` bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | 
sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
``` 

sort out acton