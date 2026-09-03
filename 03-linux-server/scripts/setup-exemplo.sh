#!/bin/bash
# Exemplo simples de setup para servidor Linux (Ubuntu/Debian)

set -e

# Atualizar pacotes
apt update && apt upgrade -y

# Criar usuário administrativo
useradd -m -s /bin/bash adminuser || true
# passwd adminuser  # definir senha localmente
usermod -aG sudo adminuser || true

# Habilitar firewall básico (ufw)
apt install -y ufw || true
ufw default deny incoming || true
ufw default allow outgoing || true
ufw allow ssh || true
ufw --force enable || true

# Instalar Nginx
apt install -y nginx || true
systemctl enable --now nginx || true

echo "Setup inicial concluído"
