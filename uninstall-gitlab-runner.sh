# Iniciar o log
echo "Iniciando o processo de desinstalação do GitLab Runner..."

# Para o serviço GitLab Runner
echo "Parando o serviço GitLab Runner..." && \
sudo gitlab-runner stop && echo "O serviço GitLab Runner foi parado com sucesso."

# Desabilite o serviço para que ele não inicie na inicialização do sistema
echo "Desabilitando o serviço GitLab Runner..." && \
sudo gitlab-runner uninstall && echo "O serviço GitLab Runner foi desabilitado com sucesso."

# Remova o pacote GitLab Runner
echo "Removendo o pacote GitLab Runner..." && \
sudo apt-get remove gitlab-runner -y && echo "O pacote GitLab Runner foi removido com sucesso."

# Dependências que não são mais necessárias
echo "Removendo dependências desnecessárias..." && \
sudo apt-get autoremove -y && echo "Dependências desnecessárias foram removidas com sucesso."

# Remova quaisquer arquivos de configuração residuais
echo "Removendo arquivos de configuração residuais..." && \
sudo rm -rf /etc/gitlab-runner && echo "Arquivos de configuração residuais removidos com sucesso."

# Remova o usuário e grupo 'gitlab-runner', se foram criados
echo "Removendo o usuário e grupo 'gitlab-runner'..." && \
sudo deluser --remove-home gitlab-runner && \
sudo delgroup gitlab-runner && echo "Usuário e grupo 'gitlab-runner' removidos com sucesso."

# Limpe quaisquer arquivos temporários ou de cache criados pelo GitLab Runner
echo "Limpando arquivos temporários ou de cache..." && \
sudo find / -name "*gitlab-runner*" -exec rm -rf {} + 2>/dev/null && echo "Arquivos temporários ou de cache limpos com sucesso."

# Remova o repositório do GitLab Runner das listas de fontes do APT, se aplicável
echo "Removendo o repositório do GitLab Runner das listas de fontes do APT..." && \
sudo rm /etc/apt/sources.list.d/runner_gitlab-runner.list && echo "Repositório do GitLab Runner removido com sucesso das listas de fontes do APT."

# Limpe o cache do APT
echo "Limpando o cache do APT..." && \
sudo apt-get clean && echo "Cache do APT limpo com sucesso."

# Atualize a lista de pacotes disponíveis
echo "Atualizando a lista de pacotes disponíveis..." && \
sudo apt-get update && echo "Lista de pacotes disponíveis atualizada com sucesso."

# Concluir o log
echo "Processo de desinstalação do GitLab Runner concluído."
