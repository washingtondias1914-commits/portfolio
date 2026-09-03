# Resumo Executivo — Servidor Linux Empresarial (Projeto 03)

## Problema
Provisionamento e hardening de servidor Linux para serviços empresariais (web, SSH, firewall) com práticas de segurança.

## O que implementei
- Instalação e configuração do Nginx, ativação do UFW com regras mínimas (SSH liberado), criação de usuário administrativo.
- Script de automação (scripts/setup-exemplo.sh) para reproducibilidade.

## Resultado (evidências anexadas)
- Nginx ativo: `systemctl status nginx` — ver evidencias/systemctl_nginx.txt
- UFW: regras aplicadas — ver evidencias/ufw_status.txt
- SSH login: print de sessão — ver evidencias/ssh-login.txt

Arquivos relacionados:
- ./scripts/setup-exemplo.sh
- ./evidencias/systemctl_nginx.txt
- ./evidencias/ufw_status.txt
- ./evidencias/ssh-login.txt

---

*Nota: evidências geradas como exemplos. Substitua por logs reais quando disponíveis.*
