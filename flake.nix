{
  description = "A flake containing all the cybersec tools I need";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-part.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [

            # --- Network Recon & Scanning ---
            nmap          # industry-standard port/service scanner
            masscan       # high-speed TCP port scanner
            rustscan      # fast port scanner wrapping nmap
            fping         # ICMP ping sweep
            arp-scan      # ARP network scanner
            netdiscover   # active/passive ARP recon
            nbtscan       # NetBIOS name scanner
            onesixtyone   # fast SNMP scanner
            hping         # TCP/IP packet crafting & scanning
            arping        # ARP-level ping
            traceroute    # network path tracing
            whois         # domain/IP registry lookup
            naabu         # fast port scanner (projectdiscovery)
            yersinia      # layer-2 protocol attack framework

            # --- OSINT & DNS Recon ---
            theharvester  # email/domain/IP OSINT aggregator
            amass         # in-depth attack surface mapping
            subfinder     # passive subdomain enumeration
            nuclei        # template-based vulnerability scanner
            dnsx          # fast DNS toolkit (projectdiscovery)
            dnsenum       # DNS enumeration & zone-transfer checks
            httpx         # fast HTTP/HTTPS prober (projectdiscovery)

            # --- Web Application Security ---
            zap           # OWASP ZAP web app scanner
            burpsuite     # web app security testing platform (unfree)
            wafw00f       # WAF detection tool
            gobuster      # directory/DNS/vhost brute-forcer
            ffuf          # fast web fuzzer
            feroxbuster   # recursive content discovery
            dirb          # classic web content scanner
            wfuzz         # web application fuzzer
            nikto         # web server vulnerability scanner
            sqlmap        # automated SQL injection tool
            commix        # command injection exploitation tool
            dalfox        # XSS scanning & parameter analysis
            whatweb       # web technology fingerprinting
            ghauri        # advanced SQL injection detection
            mx-takeover   # MX record subdomain takeover checker
            scilla        # information gathering for subdomains/ports

            # --- Exploitation & Post-Exploitation ---
            metasploit    # exploitation framework
            exploitdb     # local copy of Exploit-DB (searchsploit)
            netexec # network protocol attack Swiss army knife

            # --- Network Traffic Analysis & MITM ---
            wireshark     # GUI packet analyzer
            tcpdump       # CLI packet capture
            mitmproxy     # interactive HTTPS-capable MITM proxy
            ettercap      # network sniffer / MITM suite
            bettercap     # network recon & MITM framework
            socat         # multipurpose relay / socket tool
            ngrep         # network-layer grep
            tcpflow       # TCP stream recorder
            netcat-gnu    # read/write TCP/UDP connections
            netsniff-ng   # network toolkit (packet sniffer, replay)

            # --- Wireless Security ---
            aircrack-ng   # 802.11 WEP/WPA cracking suite
            wifite2       # automated wireless attack tool
            pixiewps      # WPS Pixie-Dust offline attack
            kismet        # wireless network detector & sniffer

            # --- Password Cracking & Brute Force ---
            john          # John the Ripper password cracker
            hashcat       # GPU-accelerated password cracker
            hashcat-utils # helper utilities for hashcat
            thc-hydra     # fast network login brute-forcer
            medusa        # parallel login brute-forcer
            ncrack        # network auth cracker (nmap project)
            crunch        # wordlist generator
            hashid        # hash type identifier
            badkeys       # weak cryptographic key detector
            ophcrack      # Windows password cracker (rainbow tables)

            # --- Reverse Engineering & Binary Analysis ---
            radare2           # reverse engineering framework
            ghidra            # NSA software reverse engineering suite
            gdb               # GNU debugger
            strace            # system call tracer
            ltrace            # library call tracer
            binwalk           # firmware analysis & extraction
            capstone          # multi-arch disassembly library/tool
            detect-it-easy    # file type & packer identifier
            pwntools          # CTF & exploit development library
            python313Packages.angr   # binary analysis platform
            python313Packages.dpkt   # network packet parsing library

            # --- Forensics & Steganography ---
            foremost      # file carving / recovery tool
            volatility3   # memory forensics framework
            exiftool      # read/write file metadata
            steghide      # steganography tool (JPEG/BMP/WAV/AU)
            hexyl         # hex viewer with colored output
            cyberchef     # web-based data encoding/analysis Swiss knife

            # --- SSL/TLS Analysis ---
            testssl       # CLI TLS/SSL cipher & vulnerability tester
            sslscan       # SSL/TLS cipher enumeration tool

            # --- Active Directory & Windows Attacks ---
            bloodhound    # AD attack path visualization
            responder     # LLMNR/NBT-NS/mDNS poisoner
            enum4linux-ng # SMB/RPC enumeration (next-gen rewrite)
            smbmap        # SMB share enumeration & access

            # --- IDS/IPS, Monitoring & Defense ---
            snort         # network intrusion detection system
            suricata      # high-performance IDS/IPS/NSM
            zeek          # network analysis framework (formerly Bro)
            crowdsec      # collaborative IPS / threat intelligence
            honeytrap     # low-interaction honeypot framework
            lynis         # security auditing tool for Unix systems
            shorewall     # iptables-based firewall configuration
            shadow        # login/passwd management utilities
            waf           # web application firewall

            # --- VPN, Tunneling & Proxying ---
            wireguard-tools  # WireGuard VPN utilities
            tor              # anonymous overlay network
            proxychains-ng   # proxy chaining for any TCP app

            # --- Misc / Other ---
            haskellPackages.nemesis  # penetration testing framework
            yas                      # yet another steganography tool
            unifi                    # Ubiquiti UniFi network controller
          ];
        };
      }
    );
}
