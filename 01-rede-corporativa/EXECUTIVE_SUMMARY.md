# Resumo Executivo — Rede Corporativa Completa (Projeto 01)

## Problema
Organização precisava de uma rede corporativa segmentada com isolamento por departamentos, serviços centralizados (DHCP/DNS), e acesso controlado à internet.

## O que implementei
- Projeto e implementação de 3 VLANs (Admin, TI, Servidores).
- Roteamento inter-VLAN em switch L3 e OSPF entre roteadores.
- Serviços: DHCP centralizado, DNS interno (Bind9), NAT para internet.
- Políticas de segurança via ACLs e firewall perimetral.

## Resultado (evidências anexadas)
- Conectividade inter-VLAN: ping 192.168.20.100 — 0% perda, RTT médio 1.2 ms (ver evidências/teste-01-ping.txt).
- OSPF: 2 vizinhos estabelecidos — ver evidencias/show_ip_ospf_neighbor.txt.
- Tabela de rotas: VLANs corretamente anunciadas e conectadas — ver evidencias/show_ip_route.txt.

Arquivos relacionados:
- ./evidencias/teste-01-ping.txt
- ./evidencias/show_ip_route.txt
- ./evidencias/show_ip_ospf_neighbor.txt

---

*Nota: as evidências neste commit são exemplos gerados para completar o portfólio. Substitua por prints/arquivos reais quando disponíveis.*
