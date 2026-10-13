#!/usr/bin/env bash
set -joeux pipefail

# 1. Forzar el inicio de sesión a través de LightDM (Xfce) en vez de SDDM
systemctl disable sddm.service || true
systemctl enable lightdm.service

# 2. Forzar la inicialización correcta del driver clásico de AMD en el kernel
echo "options radeon modeset=1" > /etc/modprobe.d/radeon.conf

# 3. Forzar el idioma predeterminado a Español de Venezuela
echo "LANG=es_VE.UTF-8" > /etc/locale.conf
echo "LC_ALL=es_VE.UTF-8" >> /etc/locale.conf

# 4. Establecer la distribución física del teclado a España
localectl set-x11-keymap es
