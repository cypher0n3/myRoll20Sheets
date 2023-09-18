#!/usr/bin/env bash

set -e

if [[ -f skills_hider.css ]]; then
    rm -f skills_hider.css
fi

i=0
while read line; do
    IFS=':' read -ra line_ary <<< "${line}"
    if [[ ! -z "${line}" ]]; then
        # line_nospaces=$(echo "${line_ary[0]}" | sed "s/\s//g")
        line_underscore=$(echo "${line_ary[0],,}" | sed "s/\s/_/g")
        echo '.charsheet .sheet-EPv2skill-hider-'"${line_underscore}"':checked ~ .sheet-EPv2skill-hider-section-'"${line_underscore}"',' >> skills_hider.css
    fi
    ((i+=1))
done < ./skills_list_alphabetical.txt
