#!/usr/bin/env bash
#
# Copyright 2026 (c) José Ángel de Bustos Pérez 
#   Author: José Ángel de Bustos Pérez <jadebustos@gmail.com>
#
# This file is free software: you can redistribute it and/or modify it under the terms of 
# the GNU General Public License v3 as published by the Free Software Foundation.
# IdM workshop is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
# See the GNU General Public License v3 for more details.

# You should have received a copy of the GNU General Public License v3
# If not, see https://www.gnu.org/licenses/gpl-3.0.en.html.
# Generate a self-signed certificate for Jupyter (or other services).
#
# Environment variables (all optional):
#   SERVER_NAME   DNS name of the server     (default: mi-servidor)
#   SERVER_IP     IP address of the server   (default: 192.168.1.50)
#   CERT_DAYS     Validity in days           (default: 365)
#   KEY_BITS      RSA key size               (default: 4096)
#   OUT_DIR       Output directory           (default: .)
#   KEY_NAME      Private key filename       (default: jupyter.key)
#   CERT_NAME     Certificate filename       (default: jupyter.crt)
#
# Example:
#   SERVER_NAME=jupyter.local SERVER_IP=10.0.0.250 CERT_DAYS=300 KEY_BITS=3072 KEY_NAME=jupyter.key CERT_NAME=jupyter.crt ./certificate-creation.sh

set -euo pipefail

SERVER_NAME="${SERVER_NAME:-*.local}"
SERVER_IP="${SERVER_IP:-192.168.1.250}"
CERT_DAYS="${CERT_DAYS:-365}"
KEY_BITS="${KEY_BITS:-4096}"
KEY_NAME="${KEY_NAME:-jupyter.key}"
CERT_NAME="${CERT_NAME:-jupyter.crt}"

echo "Generating self-signed certificate:"
echo "  CN          = ${SERVER_NAME}"
echo "  SAN DNS     = ${SERVER_NAME}, localhost"
echo "  SAN IP      = ${SERVER_IP}"
echo "  Days        = ${CERT_DAYS}"
echo "  RSA bits    = ${KEY_BITS}"
echo "  Output      = ${KEY_NAME}, ${CERT_NAME}"
echo

# Generate the certificate and private key in one step. The -addext option is used to include Subject Alternative Names (SANs).
openssl req -x509 -nodes -days "${CERT_DAYS}" -newkey "rsa:${KEY_BITS}" \
  -keyout "${KEY_NAME}" \
  -out "${CERT_NAME}" \
  -subj "/CN=${SERVER_NAME}" \
  -addext "subjectAltName=DNS:${SERVER_NAME},DNS:localhost,IP:${SERVER_IP}"

# Sensible permissions: private key readable only by the owner
chmod 600 "${KEY_NAME}"
chmod 644 "${CERT_NAME}"

echo
echo "Done. Generated files:"
ls -la "${KEY_NAME}" "${CERT_NAME}"