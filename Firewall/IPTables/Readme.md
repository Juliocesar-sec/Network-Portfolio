

# 🔥 **IPTABLES – Practical Guide (README)**

📌 **What is IPTABLES?**

iptables is a small and powerful native firewall interface for Linux systems. It is intentionally low-level: not a graphical firewall manager, not a cloud security platform, and not a wrapper around another filtering engine. The main path is direct interaction with the Linux kernel Netfilter subsystem through explicit rule chains, packet filtering logic, and routing control.

This tool exists because Linux networking is built around the idea that traffic inspection and filtering should happen close to the kernel itself, with predictable behavior and complete transparency.

Now, back to iptables. Why is it still considered important despite newer alternatives existing? Because after decades of real-world deployment, we can report that:

iptables is lightweight and available on almost every Linux distribution.
It gives direct and precise control over packet filtering behavior.
The rule system is explicit and scriptable, making it suitable for servers, routers, labs, and embedded systems.
It allows administrators to inspect, accept, reject, redirect, or log traffic with fine granularity.
It works efficiently even on low-resource machines.
It integrates directly with kernel networking features through Netfilter.
Its behavior is deterministic and easy to automate in shell scripts and deployment systems.

That said, a few important things about iptables:

The local Linux networking landscape contains many modern alternatives, but iptables remains one of the most documented and battle-tested firewall systems available.
This software is based on the philosophy that security rules should be explicit, inspectable, and controlled by the system administrator rather than hidden behind abstractions.
iptables operates through rule chains attached to different traffic stages. The most common chains are:
INPUT → controls incoming traffic
OUTPUT → controls outgoing traffic
FORWARD → controls routed traffic between interfaces
Because firewall rules directly affect connectivity, incorrect configurations can lock users out of systems remotely. Testing changes carefully is strongly recommended.
Modern Linux systems may also provide nftables, which replaces some internal iptables implementations. However, understanding iptables remains extremely valuable because many servers, tutorials, and production systems still rely on it heavily.

Our vision is that practical Linux networking knowledge should focus on understanding how packets actually move through the system, not only on using graphical tools. iptables exists because sometimes the most reliable solution is still a clear set of rules running directly inside the kernel.

# 🧠 **Basic Concepts**

**🔹 Tables**  
Tables define the type of processing:

- **filter** → Access control (most commonly used)  
- **nat** → Network Address Translation (NAT)  
- **mangle** → Packet modification  

**🔹 Chains**

- **INPUT** → Packets destined for the host itself  
- **OUTPUT** → Packets leaving the host  
- **FORWARD** → Packets passing through the host (acting as a router)  

**🔹 Targets (Actions)**

- **ACCEPT** → Allow the traffic  
- **DROP** → Silently discard the packet  
- **REJECT** → Block and send a response  
- **LOG** → Log the event  

# ⚙️ **Rule Structure**

```bash
iptables -A [CHAIN] -p [PROTOCOL] --dport [PORT] -j [ACTION]
```

**Example:**

```bash
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
```

This allows SSH connections.

# 🚀 **Essential Commands**

**List rules:**

```bash
iptables -L -v -n
```

**Flush (clear) all rules:**

```bash
iptables -F
```

**Set default policies:**

```bash
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP
```

# 🔐 **Basic Security Rules**

1. **Allow loopback** (very important)

```bash
iptables -A INPUT -i lo -j ACCEPT
```

2. **Allow established and related connections**

```bash
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
```

3. **Allow SSH (port 22)**

```bash
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
```

4. **Drop everything else**

```bash
iptables -A INPUT -j DROP
```

# 🌐 **Practical Examples with Critical Ports**

**🔸 Block Telnet (port 23)**

```bash
iptables -A INPUT -p tcp --dport 23 -j DROP
```

**🔸 Allow HTTP and HTTPS**

```bash
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
```

**🔸 Block external SMB (port 445)**

```bash
iptables -A INPUT -p tcp --dport 445 -s 192.168.0.0/16 -j ACCEPT
iptables -A INPUT -p tcp --dport 445 -j DROP
```

**🔸 Limit SSH attempts (anti brute-force)**

```bash
iptables -A INPUT -p tcp --dport 22 -m limit --limit 3/min -j ACCEPT
```

# 🛡️ **Best Practices**

- 🔒 Default policy = **DROP**  
- 🌍 Never expose unnecessary services  
- 🧠 Use IP whitelisting whenever possible  
- 🔑 Avoid password authentication (use SSH keys instead)  
- 📊 Monitor logs regularly (`/var/log/syslog` or `journalctl`)

💾 **Saving Rules**

**Debian/Ubuntu:**

```bash
iptables-save > /etc/iptables/rules.v4
```

**Restore rules:**

```bash
iptables-restore < /etc/iptables/rules.v4
```

⚠️ **Important Warnings**

- A single mistake can lock you out of your server  
- Always keep an alternative access method (console, KVM, or cloud recovery)  
- Test rules carefully before applying them in production  

📚 **Modern Alternatives**

- **nftables** → Official successor to iptables  
- **ufw** → Simplified interface (Ubuntu)  
- **firewalld** → Used in CentOS/RHEL and Fedora  

🧾 **Summary**

iptables is a powerful tool for:

- Access control  
- Attack mitigation  
- Protecting critical services  

👉 **Golden Rule:**  
**“Allow only what is necessary. Block everything else.”**
