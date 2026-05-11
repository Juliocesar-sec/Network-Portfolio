# 🦈  Wireshark Installation and Setup 🦈 

## Part 1: Download and Install Wireshark

Wireshark has become the industry standard packet-sniffer program used by network engineers. This open source software is available for many different operating systems, including Windows, Mac, and Linux.

If Wireshark is already installed on your PC, you can skip Part 1 and go directly to Part 2. If Wireshark is not installed on your PC, check with your instructor about your academy’s software download policy. 

## **Step 1: Update Package Lists**

```bash
sudo apt update
```

Updated the Debian package repository information before installing Wireshark.

 ### **1A: Install Wireshark**

```
sudo apt install wireshark
```

Installed Wireshark and all required dependencies using the Debian package manager.

![Install Wireshark](https://github.com/Juliocesar-sec/Network-Portfolio/blob/704f001e867143531e43e1e8fa4b32e17a0ced57/Network-Tools/WireShark/Screenshot/wireshark_1.png)

### **1B: Add User to the Wireshark Group**

Screenshot 3 – Adding User Permissions

```
sudo usermod -aG wireshark $USER
```

Added the current user to the wireshark group to allow packet capture without running as root.


### **1C: Apply Group Changes**

Screenshot 4 – Applying Group Membership

```
newgrp wireshark
```

Applied the new group permissions in the current terminal session.


### **1D: Verify Wireshark Installation**

Screenshot 5 – Verifying Installation

```
wireshark --version
```

Verified that Wireshark 4.4.15 was successfully installed.


![1Step 1](https://github.com/Juliocesar-sec/Network-Portfolio/blob/78a0051631f8675373576585329c5e69bae96c02/Network-Tools/WireShark/Screenshot/wireshark_2.png)
 
So after adding the group, you must either:

- Log out and log back in, or
- Reboot 

---

##  **Part 2: Capture and Analyze Local ARP Data in Wireshark**

In this part of the lab, Wireshark is used to capture and analyze ARP (Address Resolution Protocol) traffic on the local network. The goal is to observe how devices resolve IP addresses into MAC addresses when communicating on a LAN.

## Step 1: Retrieve your PC’s interface addresses. 

For this lab, you will need to retrieve your PC’s IPv4 address and the MAC address. 

### ** 1A: Identify IP and MAC Address (Debian 13)**

Before capturing traffic, the PC’s network information is required.

```bash
ip a
```

This command displays the network interfaces, IPv4 address, and MAC (link-layer) address of the system.

Example Output (Recorded Information)

```
IPv4 Address: 192.168.x.x
MAC Address: xx:xx:xx:xx:xx:xx
Interface: enp0s3 / wlan0 (depends on system)
```

### 1B – Identify Active Network Interface
Screenshot 27 – Active Network Interface

Identified the active network interface being used to access the network.

### 2C – Record IPv4 and MAC Address
Screenshot 28 – IPv4 and MAC Address

![2Step 1](https://github.com/Juliocesar-sec/Network-Portfolio/blob/fa8b82c2980a60d5258ecfea3dd005463502e3ab/Network-Tools/WireShark/Screenshot/wirewshark_3.png)

## Step 2 — Start Wireshark and Capture ARP Traffic

**2A — Launch Wireshark**

Wireshark was launched from the Debian application menu.

After opening the application, the active network interface identified earlier (enp0s3 or wlan0) was selected for packet capture.

**2B — Configure ARP Packet Filter**

To capture only ARP traffic, the following display filter was entered into the Wireshark filter bar:

```
arp
```
After selecting the correct interface and applying the ARP filter, packet capture was started by clicking the Start Capturing Packets button (shark fin icon).

This configuration allows Wireshark to display only ARP packets exchanged between devices on the local network.

![2Step 2B](https://github.com/Juliocesar-sec/Network-Portfolio/blob/4547f5f7268dc441dbe5239a53ce8dcf78047477/Network-Tools/WireShark/Screenshot/wireshark_4.png)

**Observations**

Once the capture began, live network traffic started appearing in the packet list pane.
Each entry represented communication between source and destination devices on the LAN.


**2C — Test Connectivity to the Default Gateway***

To generate ARP traffic, connectivity to the default gateway was tested using the ping command.

```
ping 192.168.1.1
Example Output
PING 192.168.1.1 (192.168.1.1) 56(84) bytes of data.
64 bytes from 192.168.1.1: icmp_seq=1 ttl=64 time=2.1 ms
64 bytes from 192.168.1.1: icmp_seq=2 ttl=64 time=1.8 ms
64 bytes from 192.168.1.1: icmp_seq=3 ttl=64 time=2.0 ms
64 bytes from 192.168.1.1: icmp_seq=4 ttl=64 time=1.9 ms
```

The successful replies confirmed network connectivity between the PC and the default gateway.

**ARP Activity**

During the ping process, Wireshark captured ARP request and ARP reply packets used to resolve the MAC address associated with the gateway’s IPv4 address.

Suggested Screenshot:

![Step 2C](https://github.com/Juliocesar-sec/Network-Portfolio/blob/292f4370b54d4b21b595dd5d98c535505def45e9/Network-Tools/WireShark/Screenshot/wireshark_5.png)

