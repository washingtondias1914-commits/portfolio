# 🔀 Infraestrutura Cisco - Projeto 02

## 📋 Descrição

Projeto focado em configuração e troubleshooting de equipamentos Cisco (switches e routers). Inclui exemplos de configuração, topologias de laboratório (Packet Tracer/GNS3) e evidências de testes.

## 🎯 Objetivos

- Configurar VLANs, trunks e SVI
- Implementar STP e EtherChannel
- Configurar roteamento OSPF e BGP (exemplos)
- Políticas de segurança (ACL, Port Security)
- Laboratório funcional (Packet Tracer / GNS3)

## 📂 Estrutura

```
02-infraestrutura-cisco/
├── README.md
├── configuracoes/
│   ├── switch-core.conf
│   └── router-core.conf
├── lab/
│   └── README.md
└── evidencias/
    ├── topologia.svg
    ├── conf-switch.svg
    └── teste-ping.txt
```

## 🔧 Exemplos rápidos

### Exemplo SVI em Switch L3

```
Switch(config)# vlan 10
Switch(config-vlan)# name ADMIN
Switch(config)# interface vlan 10
Switch(config-if)# ip address 192.168.10.2 255.255.255.0
Switch(config-if)# no shutdown
```

### Exemplo OSPF (Router)

```
Router(config)# router ospf 10
Router(config-router)# network 192.168.0.0 0.0.255.255 area 0
```

## 🧪 Laboratório

- Arquivo: `lab/rede-cisco.pkt` (Packet Tracer) — adicione o arquivo real no diretório `lab/`.

## 📸 Evidências

Coloque prints em `evidencias/` com nomes claros (topologia.svg, conf-switch.svg, teste-ping.txt).

---

**Status:** Em progresso — adicione evidências na pasta `evidencias/`.
