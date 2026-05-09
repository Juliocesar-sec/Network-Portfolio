
# 🌐 DNS Troubleshooting Guide

## Overview

This document covers common DNS (Domain Name System) issues encountered in network environments and the troubleshooting steps used to resolve them.

DNS problems can prevent users from accessing websites and network services even when internet connectivity is available.

---

# ⚠️ Common Symptoms

- Websites do not load
- “DNS Server Not Responding” message
- Ping works with IP addresses but not domain names
- Slow website access
- Intermittent internet connectivity

---

# 🔍 Diagnostic Steps

 1. **Check Internet Connectivity**

Test basic connectivity:

```bash
ping 8.8.8.8
```
If the ping succeeds, the internet connection is working.


2. **Test DNS Resolution**
   
```
nslookup google.com
```
or 

```
ping google.com
```
If domain names fail to resolve, DNS may be misconfigured.

3. **Verify DNS Server Settings**
 
Windows
```
ipconfig /all
```

Check:

- DNS server addresses
- Default gateway
- Network adapter configuration

Linux
```
cat /etc/resolv.conf
```










