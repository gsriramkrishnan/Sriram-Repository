#!/bin/bash

settings() {
    SCRIPT_DIR="$(dirname "$0")"
}

main() {
    request $@
    settings
    run
}

run() {
    echo "Do something"
}

syntax() {
    echo ""
    echo "Command description"
    echo ""
    echo "Usage:"
    echo "  command [options] [arguments]"
    echo ""
    echo "Options:"
    echo "  -h, --help     Display this help message"
}

request() {
    local SYNTAX=0

    while [[ $# > 1 ]]
    do
        case "$1" in
            --help|-h)
                SYNTAX=1
                ;;
        esac
        shift
    done

    if [[ $SYNTAX -eq 1 ]]; then
        syntax && die
    fi
}

die() {
    builtin echo $@
    exit 1
}

main $@
