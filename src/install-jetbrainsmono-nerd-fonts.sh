#!/bin/bash

UNINSTALL=false

usage() {
    echo "Usage:"
    echo "  install-jetbrainsmono-nerd-fonts.sh [options]"
    echo ""
    echo "Options:"
    echo "  -r, --remove  Remove Firefox Nightly from your system."
    echo "  -h, --help    Show help information."
    echo ""
}

install() {
    echo "Downloading..."
    wget --quiet "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip" --output-document /tmp/jetbrainsmono-nerd-fonts.zip

    echo "Extracting..."
    mkdir -p /tmp/jetbrainsmono-nerd-fonts
    unzip -qo /tmp/jetbrainsmono-nerd-fonts.zip -d /tmp/jetbrainsmono-nerd-fonts

    echo "Installing..."
    mkdir -p /usr/share/fonts/jetbrainsmono-nerd-fonts/
    cp -r /tmp/jetbrainsmono-nerd-fonts/*.ttf /usr/share/fonts/jetbrainsmono-nerd-fonts/

    echo "Cleaning up..."
    rm -rf /tmp/jetbrainsmono-nerd-fonts.zip
    rm -rf /tmp/jetbrainsmono-nerd-fonts

    echo "Done!"
}

remove() {
    echo "Removing..."

    if [ -d /usr/share/fonts/jetbrainsmono-nerd-fonts/ ]; then
        rm -r /usr/share/fonts/jetbrainsmono-nerd-fonts/
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
            UNINSTALL=true
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

    if [ "$UNINSTALL" = "true" ]; then
        remove
    else
        install
    fi
}

main "$@"
