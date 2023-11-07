# Para o serviço Gilab Runner
sudo gitlab-runner stop

# Desabilite o serviço para que ele não inicie na inicialização do sistema
sudo gitlab-runner uninstall

# Remova o pacote GitLab Runner
sudo apt-get remove gitlab-runner

# Dependências que não são mais necessárias
sudo apt-get autoremove

# Remova quaisquer arquivos de configuração residuais:
sudo rm -rf /etc/gitlab-runner

# Remova o usuário e grupo 'gitlab-runner', se foram criados
sudo deluser --remove-home gitlab-runner
sudo delgroup gitlab-runner

# Limpe quaisquer arquivos temporários ou de cache criados pelo GitLab Runner
sudo find / -name "*gitlab-runner*" 2>/dev/null

# Remova o repositório do GitLab Runner das listas de fontes do APT, se aplicável
sudo rm /etc/apt/sources.list.d/runner_gitlab-runner.list

# Limpe o cache do APT
sudo apt-get clean

# Atualize a lista de pacotes disponíveis
sudo apt-get update
