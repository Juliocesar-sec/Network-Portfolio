⚙️ 1. VERIFICAR STATUS DO UFW

🔧 Comando
```bash
sudo ufw status numbered
```
📥 O que esse comando faz

Exibe todas as regras ativas do firewall UFW com numeração.

📊 O que esperar na saída

Exemplo:
```bash
Status: active

     To                         Action      From
     --                         ------      ----
[ 1] 22/tcp                    DENY IN     Anywhere
[ 2] 80/tcp                    DENY IN     Anywhere
...
```
📸 Print
![Print1](https://github.com/Juliocesar-sec/Firewall/blob/1f6ca9ed759d184622efe75b99832517c1db72e1/Ufw/Rules/Screenshot/Screenshot_1.png)

🔒 2. APLICAR BLOQUEIO DAS PORTAS

🔧 Comando (modelo geral)
sudo ufw deny PORT/protocol
```bash
🌐 Portas TCP

sudo ufw deny 21/tcp
sudo ufw deny 22/tcp
sudo ufw deny 23/tcp
sudo ufw deny 25/tcp
sudo ufw deny 53/tcp
sudo ufw deny 80/tcp
sudo ufw deny 111/tcp
sudo ufw deny 443/tcp
sudo ufw deny 445/tcp
sudo ufw deny 5900/tcp
sudo ufw deny 3306/tcp
sudo ufw deny 5432/tcp
sudo ufw deny 6379/tcp
sudo ufw deny 2049/tcp
sudo ufw deny 27017/tcp

📡 Portas UDP

sudo ufw deny 1900/udp
sudo ufw deny 5353/udp
```
📥 O que acontece ao executar

Para cada comando, o terminal deve retornar algo como:
```bash
Rule added
Rule added (v6)
```
📸 Print
![Print2](https://github.com/Juliocesar-sec/Firewall/blob/1f6ca9ed759d184622efe75b99832517c1db72e1/Ufw/Rules/Screenshot/Screenshot_2.png)

🔁 3. RECARREGAR O FIREWALL
🔧 Comando
```bash
sudo ufw reload
```
📥 O que faz
Recarrega todas as regras aplicadas sem reiniciar o sistema.

📊 Saída esperada
```bash
Firewall reloaded
```

📸 Print
![Print3](https://github.com/Juliocesar-sec/Firewall/blob/c973eed2d8b5d5a8a8f469e01272445b701617d2/Ufw/Rules/Screenshot/Screenshot_3.png)

🧾 4. VERIFICAR REGRAS FINALIZADAS
🔧 Comando
```bash
sudo ufw status verbose
```
📥 O que faz

Mostra:

estado do firewall
política padrão
regras aplicadas
IPv6 (se ativo)
```bash
📊 Saída esperada
Status: active
Logging: on (low)
Default: deny (incoming), allow (outgoing)

To                         Action      From
--                         ------      ----
22/tcp                    DENY IN     Anywhere
80/tcp                    DENY IN     Anywhere
...
```
🧠 5. INTERPRETAÇÃO DOS RESULTADOS
✅ O que significa o resultado

DENY IN → conexões externas bloqueadas
Anywhere → regra aplicada globalmente
(v6) → regra também aplicada para IPv6
Status: active → firewall está ativo e funcionando

🛡️ 6. CONCLUSÃO

Após a aplicação das regras:

Todas as portas sensíveis foram bloqueadas
O sistema não aceita conexões externas nesses serviços
A superfície de ataque foi significativamente reduzida

🚀 EXTRA (OPCIONAL – BOA PRÁTICA)

Se quiser reforçar segurança total:
```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```
