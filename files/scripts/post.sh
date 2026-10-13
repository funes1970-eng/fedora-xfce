#!/usr/bin/env bash
set -joeux pipefail

# Asegurar que LightDM (Xfce) reemplace por completo al gestor de KDE (SDDM)
systemctl disable sddm.service || true
systemctl enable lightdm.service
