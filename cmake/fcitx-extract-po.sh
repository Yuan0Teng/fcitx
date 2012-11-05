#!/bin/bash

action="$1"

shift 1 || exit 1

. "$(dirname ${BASH_SOURCE})/fcitx-write-po.sh"

case "${action}" in
    -c)
        in_file="${1}"
        if str_match "*.po" "${in_file}"; then
            exit 0
        elif str_match "*.pot" "${in_file}"; then
            exit 0
        fi
        exit 1
        ;;
    -w)
        out_file="${1}"
        shift || exit 1
        merge_all_pos "${out_file}" "$@"
        exit 0
        ;;
esac
