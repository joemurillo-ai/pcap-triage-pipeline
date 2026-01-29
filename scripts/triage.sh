#!/usr/bin/env bash
set -euo pipefail

PCAP="${1:-}"
OUTDIR="${2:-out}"

if [[ -z "${PCAP}" ]]; then
  echo "Usage: ./scripts/triage.sh <capture.pcap|capture.pcapng> [outdir]"
  exit 1
fi

mkdir -p "${OUTDIR}"

echo "[*] Extracting DNS queries..."
tshark -r "${PCAP}" -Y "dns.qry.name" -T fields -e dns.qry.name 2>/dev/null \
  | sort | uniq -c | sort -nr > "${OUTDIR}/dns.txt" || true

echo "[*] Extracting TLS SNI..."
tshark -r "${PCAP}" -Y "tls.handshake.extensions_server_name" -T fields -e tls.handshake.extensions_server_name 2>/dev/null \
  | sort | uniq -c | sort -nr > "${OUTDIR}/sni.txt" || true

echo "[*] Protocol hierarchy stats..."
tshark -r "${PCAP}" -q -z io,phs 2>/dev/null > "${OUTDIR}/protocols.txt" || true

echo "[*] Done."
echo "Outputs:"
echo "  ${OUTDIR}/dns.txt"
echo "  ${OUTDIR}/sni.txt"
echo "  ${OUTDIR}/protocols.txt"
