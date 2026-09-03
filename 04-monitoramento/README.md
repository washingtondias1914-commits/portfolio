# 🖥️ Projeto 04 - Infraestrutura com Monitoramento (Consolidado)

> Arquivo consolidado: este README incorpora o conteúdo que antes estava em `03-monitoramento`.

## 📋 Descrição

Stack completa de monitoramento e logging para infraestrutura corporativa usando Zabbix, Prometheus, Grafana e ELK Stack. Este diretório reúne a configuração das stacks, dashboards, templates e evidências.

---

## 🎯 Objetivos Alcançados

- ✅ Implementação de Zabbix para monitoramento
- ✅ Configuração de Prometheus + Grafana
- ✅ Stack ELK para centralização de logs
- ✅ Dashboards customizados
- ✅ Alertas e notificações (Slack / Email)
- ✅ Retenção de histórico e relatórios
- ✅ Checklists e troubleshooting básico

---

## 📂 Estrutura de Arquivos

```
04-monitoramento/
├── README.md                    # Este arquivo consolidado
├── zabbix/
│   ├── docker-compose.yml       # Stack Zabbix
│   ├── hosts.json               # Hosts a monitorar
│   ├── templates/               # Templates customizados
│   └── alertas/                 # Configuração de alertas
├── grafana/
│   ├── docker-compose.yml       # Stack Grafana (opcional)
│   ├── dashboards/              # Dashboards JSON / snapshots
│   ├── provisioning/            # Provisionamento
│   └── alertas/                 # Alertas Grafana
├── prometheus/
│   ├── prometheus.yml           # Config
│   └── rules/                   # Alert rules
├── elk-stack/
│   ├── docker-compose.yml       # Stack ELK
│   ├── logstash/                # Configurações Logstash
│   ├── elasticsearch/           # Configurações Elasticsearch
│   └── kibana/                  # Configurações Kibana
└── evidencias/
    ├── grafana-dashboard.png
    ├── zabbix-dashboard.png
    ├── kibana-dashboard.png
    └── alerts-history.log
```

---

## 🚀 Como Usar (resumo rápido)

Pré-requisitos: Docker e Docker Compose, 4GB RAM mínimo, portas 3000/5601/9090 etc. Para iniciar as stacks:

```bash
# Exemplo (cada stack em seu diretório)
cd 04-monitoramento/zabbix
docker-compose up -d

cd ../grafana
docker-compose up -d

cd ../elk-stack
docker-compose up -d
```

Acessos (exemplo local):
- Zabbix: http://localhost:10080 (admin/zabbix)
- Grafana: http://localhost:3000 (admin/admin)
- Kibana: http://localhost:5601

---

## 🔧 Arquitetura de Monitoramento (visão)

Servidores monitorados (Linux, Windows, Routers, Switches, Apps) → Zabbix Agents / Prometheus Exporters → Coleta (Zabbix / Prometheus) → Armazenamento (DB / TSDB) → Visualização (Grafana / Kibana) → Alertas (Slack / Email)

---

## 📊 Componentes e Configurações

### Zabbix
- Versão sugerida: 6.x
- Componentes: Zabbix Server, Agent, Database (MySQL/Postgres), Web frontend
- Exemplos de itens monitorados: CPU, memória, disco, interfaces, processos, logs

### Prometheus + Grafana
- Prometheus: scrape interval 15s, targets configurados em `prometheus/prometheus.yml`
- Grafana: dashboards JSON em `grafana/dashboards/`, provisioning para datasources

### ELK Stack
- Elasticsearch, Logstash e Kibana com pipelines de processamento de logs
- Retention e políticas de índices configuráveis em `elasticsearch/`

---

## 📈 Exemplos de Métricas / Queries

#### Prometheus (PromQL)
```promql
# CPU usage
100 - (avg(rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)

# Memory usage
(1 - node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes) * 100
```

#### Itens Zabbix (exemplos)
- system.cpu.load[all,avg1]
- vm.memory.size[available]
- vfs.fs.size[/,used]
- net.if.in[eth0]

---

## 🔔 Alertas Configurados (exemplos)

| Alerta | Condição | Ação |
|--------|----------|------|
| CPU Alta | >80% por 5min | Email + Slack |
| Memória Crítica | >90% | Email + SMS |
| Disco Cheio | >85% | Email + Ticket |
| Serviço Down | Unreachable | Slack |

---

## ✅ Checklist de Validação

- [ ] Zabbix coletando dados de todos os hosts
- [ ] Prometheus scrapeando todos os targets
- [ ] Grafana exibindo dashboards corretamente
- [ ] Alertas sendo disparados e notificados
- [ ] ELK processando logs sem erros
- [ ] Retenção de dados configurada
- [ ] Backups dos dados de monitoramento

---

## 🐛 Troubleshooting (comandos úteis)

Zabbix não coleta dados:
```bash
zabbix_get -s 192.168.1.100 -k system.uptime
docker logs zabbix-server
docker restart zabbix-server
```

Prometheus não scrapeando:
```bash
curl http://localhost:9090/api/v1/targets
docker logs prometheus
```

Kibana sem dados:
```bash
curl http://localhost:9200/_cat/indices
```

---

## 📚 Referências
- Zabbix Documentation: https://www.zabbix.com/documentation
- Prometheus Documentation: https://prometheus.io/docs
- Grafana Documentation: https://grafana.com/docs
- Elastic Documentation: https://www.elastic.co/guide

---

## MIGRATION NOTE
Conteúdo anteriormente em `03-monitoramento` foi consolidado aqui. A pasta `03-monitoramento` foi preservada com um README de migração (veja `../03-monitoramento/README.md`). Para recuperar versões antigas consulte o histórico de commits.

---

**Status:** Consolidado | **Data:** Setembro 2024
