# stunnel-legacy

⚡ **Legacy TLS/SSL Handshake Test Container**

This repository provides a test container designed to emulate legacy TLS/SSL handshake environments,  
specifically targeting old systems (like SUSE 8/9) that require **TLS 1.0** or even **SSLv3**.

---

## 📦 What’s included?

✅ `Dockerfile`:  
Builds a container using **Debian 7 Wheezy** to access OpenSSL 1.0.x,  
which supports deprecated protocols like TLSv1 and SSLv3.

✅ `stunnel.conf`:  
Sample stunnel configuration for setting up client/server tunnels  
using older cipher and protocol settings.

---

## 🚀 How to build

```bash
podman build -t stunnel-legacy:debian7 .

## How to run

```bash
podman run --rm stunnel-legacy:debian7


⚠ Important Notes

    This container allows unauthenticated package installs
    due to the Debian 7 archive’s expired GPG keys.
    ✅ Use only for internal testing.

    This is not suitable for production or public deployment.

    Designed to help bridge old systems stuck on legacy protocols
    with modern infrastructure (Camelot, Frodo, etc.).
