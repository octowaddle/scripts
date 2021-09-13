#!/bin/bash

UNINSTALL=false

usage() {
    echo "Usage:"
    echo "  install-shuretechmono-nerd-fonts.sh [options]"
    echo ""
    echo "Options:"
    echo "  -r, --remove  Remove ShureTechMono Nerd Fonts from your system."
    echo "  -h, --help    Show help information."
    echo ""
}

install() {
    echo "Downloading..."
    wget --quiet "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/ShareTechMono.zip" --output-document /tmp/shuretechmono-nerd-fonts.zip

    echo "Extracting..."
    mkdir -p /tmp/shuretechmono-nerd-fonts
    unzip -qo /tmp/shuretechmono-nerd-fonts.zip -d /tmp/shuretechmono-nerd-fonts

    echo "Installing..."
    mkdir -p /usr/share/fonts/shuretechmono-nerd-fonts/
    cp -r /tmp/shuretechmono-nerd-fonts/*.ttf /usr/share/fonts/shuretechmono-nerd-fonts/

    echo "Cleaning up..."
    rm -rf /tmp/shuretechmono-nerd-fonts.zip
    rm -rf /tmp/shuretechmono-nerd-fonts

    echo "Done!"
}

remove() {
    echo "Removing..."

    if [ -d /usr/share/fonts/shuretechmono-nerd-fonts/ ]; then
        rm -r /usr/share/fonts/shuretechmono-nerd-fonts/
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
