# PCAP Triage Pipeline

Beginner-friendly workflow to capture packets, extract key indicators (DNS + TLS SNI + protocol stats), and generate a clean Markdown report you can show on GitHub.

## What this does (in plain English)

1. **Capture traffic** (.pcap / .pcapng) while you browse or run test commands.
2. **Extract signals**:
   - DNS lookups (domain → IP)
   - TLS SNI (what hostname a TLS connection is asking for)
   - Protocol stats (what types of traffic were seen)
3. **Generate outputs** you can commit:
   - `outputs/dns.txt`, `outputs/sni.txt`, `outputs/protocols.txt`
   - `report.md` (your final “incident-style” summary)

## Quickstart (WSL / Ubuntu)
### Install tools
### Quickstart

Run the triage script against a capture file:

```bash
./scripts/triage.sh capture.pcapng
```
### Outputs
- outputs/dns.txt
- outputs/sni.txt
- outputs/protocols.txt
- report.md (fill this using report_template.md)
## Write the report

1. Copy the template:
   ```bash
   cp report_template.md report.md
   ```
