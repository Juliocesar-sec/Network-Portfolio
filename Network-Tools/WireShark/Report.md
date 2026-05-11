# Wireshark Installation and Setup

## Part 1: Download and Install Wireshark

### **Step 1: Update Package Lists**

```bash
sudo apt update
```

Updated the Debian package repository information before installing Wireshark.

 ## **Step 2: Install Wireshark**


```
sudo apt install wireshark
```

Installed Wireshark and all required dependencies using the Debian package manager.

![Install Wireshark](https://github.com/Juliocesar-sec/Network-Portfolio/blob/704f001e867143531e43e1e8fa4b32e17a0ced57/Network-Tools/WireShark/Screenshot/wireshark_1.png)

### **Step 3: Add User to the Wireshark Group**

Screenshot 3 – Adding User Permissions

```
sudo usermod -aG wireshark $USER
```

Added the current user to the wireshark group to allow packet capture without running as root.


### **Step 4: Apply Group Changes**

Screenshot 4 – Applying Group Membership

```
newgrp wireshark
```

Applied the new group permissions in the current terminal session.


### **Step 5: Verify Wireshark Installation**

Screenshot 5 – Verifying Installation

```
wireshark --version
```

Verified that Wireshark 4.4.15 was successfully installed.


![Step 345](https://github.com/Juliocesar-sec/Network-Portfolio/blob/78a0051631f8675373576585329c5e69bae96c02/Network-Tools/WireShark/Screenshot/wireshark_2.png)


