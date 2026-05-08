#!/bin/bash

# ufw-colorlog-installer.sh
# Monitor de Firewall UFW com realce de sintaxe para Debian/Ubuntu

echo "[+] Configurando log do UFW para nível máximo..."
sudo ufw logging full

echo "[+] Instalando dependências (ccze)..."
sudo apt update && sudo apt install -y ccze

# Verifica se a função já existe no .bashrc para evitar duplicatas
if ! grep -q "ufw-colorlog()" ~/.bashrc; then
    echo "[+] Adicionando função ufw-colorlog ao ~/.bashrc..."
    cat << 'EOF' >> ~/.bashrc

# === UFW Color Log Avançado ===
# Monitora logs do kernel em tempo real com cores por tipo de evento
ufw-colorlog() {
  sudo journalctl -k -f | awk '
  /BLOCK|DENIED|INVALID|DROP/ {
    print "\033[1;31m[✖] BLOQUEADO: " $0 "\033[0m"; next
  }
  /DPT=23|DPT=445|DPT=3389|DPT=1433|DPT=21|DPT=22/ {
    print "\033[1;31;5m[!] PORTA CRÍTICA: " $0 "\033[0m"; next
  }
  /ALLOW/ {
    print "\033[1;32m[✔] PERMITIDO: " $0 "\033[0m"; next
  }
  /SRC=/ {
    print "\033[1;33m[~] CONEXÃO ATIVA: " $0 "\033[0m"; next
  }
  {
    print "\033[0;37m" $0 "\033[0m";
  }'
}
EOF
    echo "[✔] Função adicionada com sucesso!"
else
    echo "[!] A função ufw-colorlog já existe no seu ~/.bashrc."
fi

echo -e "\n--- INSTALAÇÃO CONCLUÍDA ---"
echo "Para ativar agora, execute: source ~/.bashrc"
echo "Para monitorar seu firewall, digite: ufw-colorlog"
