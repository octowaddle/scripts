#!/bin/bash

REMOVE=false

usage() {
    echo "Usage:"
    echo "  setup-touchpad-config.sh [options]"
    echo ""
    echo "Options:"
    echo "  -r, --remove  Remove the touchpad config from your system."
    echo "  -h, --help    Show help information."
    echo ""
}

install() {
    echo "Installing..."
    mkdir -p /etc/X11/xorg.conf.d
    echo -e 'Section "InputClass"\n    Identifier "touchpad"\n    MatchIsTouchpad "on"\n    Driver "libinput"\n    Option "Tapping" "on"\n    Option "TappingButtonMap" "lrm"\n    Option "NaturalScrolling" "on"\n    Option "ScrollMethod" "twofinger"\nEndSection\n' >/etc/X11/xorg.conf.d/90-touchpad.conf

    echo "Done!"
}

remove() {
    echo "Removing..."

    if [ -f /etc/X11/xorg.conf.d/90-touchpad.conf ]; then
        rm -r /etc/X11/xorg.conf.d/90-touchpad.conf
    fi

    echo "Done!"
}

main() {
    while [ "$1" != "" ]; do
        case $1 in
        -h | --help)
            usage
            exit 0
            ;;
        -r | --remove)
            REMOVE=true
            ;;
        *)
            usage
            exit 1
            ;;
        esac
        shift
    done

    if [ "$(id -u)" -ne 0 ]; then
        echo "Error: This command has to be run with superuser privileges (under the root user on most systems)." >&2
        exit 1
    fi

    if [ "$REMOVE" = "true" ]; then
        remove
    else
        install
    fi
}

main "$@"
