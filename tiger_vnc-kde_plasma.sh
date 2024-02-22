#!/bin/bash

# Función para instalar y configurar TigerVNC con el entorno de escritorio GNOME de Ubuntu
instalar_tigervnc_gnome() {
    # Instalar TigerVNC y el entorno de escritorio GNOME
    sudo apt update
    sudo apt install -y tigervnc-standalone-server tigervnc-common tigervnc-xorg-extension tigervnc-viewer ubuntu-desktop

    # Establecer la contraseña "changeme" para el usuario actual
    echo "changeme" | vncpasswd -f > ~/.vnc/passwd
    chmod 600 ~/.vnc/passwd

    # Configurar el archivo de configuración de TigerVNC
    cat <<EOF > ~/.vnc/config
geometry=1920x1080
localhost=no
EOF

    # Reiniciar el servicio de TigerVNC
    vncserver -kill :1
    vncserver
}

# Función para iniciar una sesión de VNC
iniciar_sesion_vnc() {
    vncserver
}

# Función para cerrar las sesiones abiertas de VNC
cerrar_sesiones_vnc() {
    vncserver -kill :1
}

# Mostrar el menú y ejecutar la opción seleccionada
while true; do
    echo "Selecciona una opción:"
    echo "1. Instalar y configurar TigerVNC con el entorno de escritorio GNOME de Ubuntu"
    echo "2. Iniciar una sesión de VNC"
    echo "3. Cerrar las sesiones de VNC"
    echo "4. Salir"

    read opcion

    case $opcion in
        1) instalar_tigervnc_gnome;;
        2) iniciar_sesion_vnc;;
        3) cerrar_sesiones_vnc;;
        4) exit;;
        *) echo "Opción inválida";;
    esac
done
