#!/usr/bin/env bash

set -e

if [[ -f skills_hider.html ]]; then
    rm -f skills_hider.html
fi

echo '    <div class="sheet-table">' >> skills_hider.html
echo '        <div class="sheet-table-row">'  >> skills_hider.html

i=0
while read line; do
    line_nospaces=$(echo "${line}" | sed "s/\s//g")
    line_underscore=$(echo "${line,,}" | sed "s/\s/_/g")
    if (! ((${i} % 5)) ) && ((${i} != 0)); then
        echo '        </div>' >> skills_hider.html
        echo '        <div class="sheet-table-row">' >> skills_hider.html
    fi
    if [[ "${line}" == "BLANK" ]]; then
        echo '            <div class="sheet-table-cell sheet-cell-a"></div>'>> skills_hider.html
    else
        echo '            <div class="sheet-table-cell sheet-cell-a"><input type="checkbox" class="sheet-ep2-skill-'"${line_underscore}"'" name="attr_EP2-Skill-Hider-'"${line_nospaces}"'" /> '"${line}"' </div>' >> skills_hider.html
    fi
    ((i+=1))
done < ./skills_list.txt

echo '        </div>' >> skills_hider.html
echo '    </div>' >> skills_hider.html
