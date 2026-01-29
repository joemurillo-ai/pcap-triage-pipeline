# PCAP Triage Pipeline

Beginner-friendly workflow to capture packets, extract key indicators (DNS + TLS SNI + protocol stats), and generate a clean Markdown report you can show on GitHub.

## What this does (in plain English)

1. **Capture traffic** (`.pcapng`) while you browse or run test commands.
2. **Extract signals**:
   - DNS lookups (domain → IP)
   - TLS SNI (what hostname a TLS connection is asking for)
   - Protocol stats (what types of traffic were seen)
3. **Generate outputs** you can commit:
   - `outputs/dns.txt`, `outputs/sni.txt`, `outputs/protocols.txt`
   - `report.md` (your final “incident-style” summary)

## Quickstart (WSL / Ubuntu)

### Install tools
```bash
sudo apt update
sudo apt install -y tshark wireshark-common
