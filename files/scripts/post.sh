#!/usr/bin/env bash
set -joeux pipefail

# Asegurar que LightDM (Xfce) reemplace por completo al gestor de KDE (SDDM)
systemctl disable sddm.service || true
systemctl enable lightdm.service
# Forzar el uso del driver clásico radeon en el arranque
echo "options radeon modeset=1" > /etc/modprobe.d/radeon.conf
# Generar y establecer los locales del sistema a Español (Venezuela)
echo "LANG=es_VE.UTF-8" > /etc/locale.conf
echo "LC_ALL=es_VE.UTF-8" >> /etc/locale.conf
# Configurar el teclado por defecto a Español Latinoamericano
# (Cambia "latam" por "es" si tu teclado tiene la 'Ñ' al lado de la 'L')
localectl set-x11-keymap latam
