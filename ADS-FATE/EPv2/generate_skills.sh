#!/usr/bin/env bash

set -e

if [[ -f skills.html ]]; then
    rm -f skills.html
fi

echo '<!-- Eclipse Phase v2 Skills -->
<input class="sheet-skills-list-selector sheet-skills-list-eclipse_phase2" type="checkbox" name="attr_skillListSelect" value="Eclipse_Phase2" checked />
<div class="sheet-skills-section-eclipse_phase2">
    <div class="sheet-headerbar">Eclipse Phase v2 Skills
        <input type="checkbox" class="sheet-checkbox-graygear sheet-ep2-skills-display-selection-hider" name="attr_EPv2Skills-Display-Selection-Hider" style="float:right" checked /><span style="vertical-align:middle; position:relative; float:right; margin-right:-20px; margin-top:-2px"/>
    </div>
    <div class="sheet-table sheet-input-border">
        <div class="sheet-table-row sheet-boldCenter">
            <div class="sheet-table-cell sheet-cell-button" title="Skill roller"></div>
            <div class="sheet-table-cell sheet-cell-a"    title="Skill name">Name</div>
            <div class="sheet-table-cell sheet-cell-10"   title="Associated aptitude for skill">Aptitude</div>
            <div class="sheet-table-cell sheet-cell-rank" title="Bonus from total aptitude">Apt</div>
            <div class="sheet-table-cell sheet-cell-rank" title="Ego ranks in skill">Rank</div>
            <div class="sheet-table-cell sheet-cell-rank" title="Skill bonus from morph">Morph</div>
            <div class="sheet-table-cell sheet-cell-rank" title="Skill bonus from other source">Misc.</div>
            <div class="sheet-table-cell sheet-cell-rank" title="Skill total from all sources">Total</div>
            <div class="sheet-table-cell sheet-cell-button"></div>
        </div>
    </div>
    <!-- Eclipse_Phase2 skills list -->
    <div>' >> skills.html

i=0
while read line; do
    cog_selected=""
    int_selected=""
    ref_selected=""
    sav_selected=""
    som_selected=""
    wil_selected=""
    if [[ ! -z "${line}" ]]; then
        IFS=':' read -ra line_ary <<< "${line}"
        line_nospaces=$(echo "${line_ary[0]}" | sed "s/\s//g")
        line_underscore=$(echo "${line_ary[0],,}" | sed "s/\s/_/g")

        if [[ "${line_ary[1]}" == "COG" ]]; then
            cog_selected=" selected"
        elif [[ "${line_ary[1]}" == "INT" ]]; then
            int_selected=" selected"
        elif [[ "${line_ary[1]}" == "REF" ]]; then
            ref_selected=" selected"
        elif [[ "${line_ary[1]}" == "SAV" ]]; then
            sav_selected=" selected"
        elif [[ "${line_ary[1]}" == "SOM" ]]; then
            som_selected=" selected"
        elif [[ "${line_ary[1]}" == "WIL" ]]; then
            wil_selected=" selected"
        fi

        case "${line_ary[0]}" in
            *1|*2|*3|*4)
                name_disabled=''
            ;;
            *)
                name_disabled='disabled="disabled"'
            ;;
        esac
        echo '        <!-- Eclipse_Phase2 skill '"${line_ary[0]}"' -->
        <input type="checkbox" class="sheet-hider-invis sheet-ep2-skill-hider-'"${line_underscore}"'" name="attr_EPv2Skill-Hider-'"${line_nospaces}"'" />
        <div class="sheet-ep2-skill-hider-section-'"${line_underscore}"'">
            <div class="sheet-table sheet-topBorderGray sheet-input-border sheet-select-border">
                <div class="sheet-table-row">
                    <div class="sheet-table-cell sheet-cell-button"><button type="roll" value=""></button></div>
                    <div class="sheet-table-cell sheet-cell-a" title="'"${line_ary[0]}"' ('"${line_ary[1]}"')"><input type="text" name="attr_EP2Skill'"${line_nospaces}"'Name" value="'"${line_ary[0]}"' ('"${line_ary[1]}"')" placeholder="Skill Name" '"${name_disabled}"'/></div>
                    <div class="sheet-table-cell sheet-cell-10" title="Associated aptitude for skill"><select name="attr_EP2Skill'"${line_nospaces}"'Apt">
                        <option value="@{EPv2CogTotal}"'"${cog_selected}"'>COG</option>
                        <option value="@{EPv2IntTotal}"'"${int_selected}"'>INT</option>
                        <option value="@{EPv2RefTotal}"'"${ref_selected}"'>REF</option>
                        <option value="@{EPv2SavTotal}"'"${sav_selected}"'>SAV</option>
                        <option value="@{EPv2SomTotal}"'"${som_selected}"'>SOM</option>
                        <option value="@{EPv2WilTotal}"'"${wil_selected}"'>WIL</option>
                        <option value="@{EPv2Skill-'"${line_nospaces}"'-CusomtAptVal}">Custom</option></select>
                    </div>
                    <div class="sheet-table-cell sheet-cell-rank" title="Bonus from total aptitude"><input type="number" name="attr_EP2Skill'"${line_nospaces}"'AptDisplay" value="@{EP2Skill'"${line_nospaces}"'Apt}" disabled="disabled" /></div>
                    <div class="sheet-table-cell sheet-cell-rank" title="Ego ranks in skill"><input type="number" name="attr_EP2Skill'"${line_nospaces}"'Base" value="0" /></div>
                    <div class="sheet-table-cell sheet-cell-rank" title="Skill bonus from morph">
                        <input type="hidden" name="attr_EP2Skill'"${line_nospaces}"'MorphBonus" value="0"\>
                        <input type="number" name="attr_EP2Skill'"${line_nospaces}"'MorphBonusDisplay" value="@{EP2Skill'"${line_nospaces}"'MorphBonus}" disabled="disabled"/>
                    </div>
                    <div class="sheet-table-cell sheet-cell-rank" title="Skill bonus from other source"><input type="number" name="attr_EP2Skill'"${line_nospaces}"'MiscBonus" value="0" /></div>
                    <div class="sheet-table-cell sheet-cell-rank sheet-input-disabled" title="Skill total from all sources"><input type="number" name="attr_EP2Skill'"${line_nospaces}"'Total" disabled="disabled" value="[[@{EP2Skill'"${line_nospaces}"'Apt}+@{EP2Skill'"${line_nospaces}"'Base}+@{EP2Skill'"${line_nospaces}"'MorphBonus}+@{EP2Skill'"${line_nospaces}"'MiscBonus}]]" /></div>
                    <div class="sheet-table-cell sheet-cell-button"><input type="checkbox" class="sheet-checkbox-graygear" name="attr_EPv2Skill-Details-Hider-'"${line_nospaces}"'" checked /><span/></div>
                </div>
            </div>
            <input type="checkbox" class="sheet-hider sheet-hider-invis" name="attr_EPv2Skill-Details-Hider-'"${line_nospaces}"'" checked />
            <div class="sheet-input-border sheet-hide-section">
                <div class="sheet-table-cell sheet-cell-a" style="padding-right:5px"><textarea class="sheet-multiline-input" name="attr_EP2Skill'"${line_nospaces}"'NameDetails" placeholder="'"${line_ary[0]}"' specializations and details"></textarea></div>
                <div class="sheet-table-cell sheet-cell-7" style="font-weight:bold; min-width:55px" title="Custom Aptitude Value for if '"'Custom'"' is selected in the Aptitude drop-down">Custom Apt Val:</div>
                <div class="sheet-table-cell sheet-cell-rank" title="Custom Aptitude Value for if '"'Custom'"' is selected in the Aptitude drop-down"><input type="number" name="attr_EP2Skill'"${line_nospaces}"'CusomtAptVal" value="0" /></div>
            </div>
        </div> <!-- Eclipse_Phase2 skill '"${line_ary[0]}"' End -->' >> skills.html

    fi
    ((i+=1))
done < ./skills_list_alphabetical.txt

echo '
        <!-- Eclipse_Phase2 Skills repeating -->
        <fieldset class="repeating_EPv2Skills"> <!-- EP2 Skills Repeating -->
            <div class="sheet-table sheet-topBorderGray sheet-input-border sheet-select-border">
                <div class="sheet-table-row">
                    <div class="sheet-table-cell sheet-cell-button"><button type="roll" value=""></button></div>
                    <div class="sheet-table-cell sheet-cell-a" title="Custom skill"><input type="text" name="attr_EPv2Skill-Repeating-Name" value="Custom Skill" placeholder="Skill Name" /></div>
                    <div class="sheet-table-cell sheet-cell-10" title="Associated aptitude for skill"><select name="attr_EPv2Skill-Repeating-Apt">
                        <option value="0" selected></option>
                        <option value="@{EPv2CogTotal}">COG</option>
                        <option value="@{EPv2IntTotal}">INT</option>
                        <option value="@{EPv2RefTotal}">REF</option>
                        <option value="@{EPv2SavTotal}">SAV</option>
                        <option value="@{EPv2SomTotal}">SOM</option>
                        <option value="@{EPv2WilTotal}">WIL</option>
                        <option value="@{EPv2Skill-Repeating-CusomtAptVal}">Custom</option></select>
                    </div>
                    <div class="sheet-table-cell sheet-cell-rank" title="Bonus from total aptitude"><input type="number" name="attr_EPv2Skill-Repeating-Apt-display" value="@{EPv2Skill-Repeating-Apt}" disabled="disabled" /></div>
                    <div class="sheet-table-cell sheet-cell-rank" title="Ego ranks in skill"><input type="number" name="attr_EPv2Skill-Repeating-Base" value="0" /></div>
                    <div class="sheet-table-cell sheet-cell-rank" title="Skill bonus from morph"><input type="number" name="attr_EPv2Skill-Repeating-MorphBonus" value="0" /></div>
                    <div class="sheet-table-cell sheet-cell-rank" title="Skill bonus from other source"><input type="number" name="attr_EPv2Skill-Repeating-MiscBonus" value="0" /></div>
                    <div class="sheet-table-cell sheet-cell-rank sheet-input-disabled" title="Skill total from all sources"><input type="number" name="attr_EPv2Skill-Repeating-Total" disabled="disabled" value="[[@{EPv2Skill-Repeating-Apt}+@{EPv2Skill-Repeating-Base}+@{EPv2Skill-Repeating-MorphBonus}+@{EPv2Skill-Repeating-MiscBonus}]]" /></div>
                    <div class="sheet-table-cell sheet-cell-button"><input type="checkbox" class="sheet-checkbox-graygear" name="attr_EPv2Skill-Details-Hider-Repeating" checked /><span/></div>
                </div>
            </div>
            <input type="checkbox" class="sheet-hider sheet-hider-invis" name="attr_EPv2Skill-Details-Hider-Repeating" checked />
            <div class="sheet-input-border sheet-hide-section">
                <div class="sheet-table-cell sheet-cell-a" style="padding-right:5px"><textarea class="sheet-multiline-input" name="attr_EPv2Skill-Repeating-Name-Details" placeholder="Custom skill specializations and details"></textarea></div>
                <div class="sheet-table-cell sheet-cell-7" style="font-weight:bold; min-width:55px" title="Custom Aptitude Value for if '"'Custom'"' is selected in the Aptitude drop-down">Custom Apt Val:</div>
                <div class="sheet-table-cell sheet-cell-rank" title="Custom Aptitude Value for if '"'Custom'"' is selected in the Aptitude drop-down"><input type="number" name="attr_EPv2Skill-Repeating-CusomtAptVal" value="0" /></div>
            </div>
        </fieldset> <!-- End Eclipse_Phase2 Skills repeating -->
    </div><!-- End Eclipse Phase v2 Skills List-->

    <!-- Eclipse_Phase2 Skills display hider -->
    <input type="checkbox" class="sheet-hider-invis sheet-ep2-skills-display-selection-hider" name="attr_EPv2Skills-Display-Selection-Hider" checked />
    <div class="sheet-ep2-skills-display-selection-section">
        <div class="sheet-headerbar">EP v2 Skills to Display</div>
        <div class="sheet-table">
            <div class="sheet-table-row">'  >> skills.html

i=0
while read line; do
    line_nospaces=$(echo "${line}" | sed "s/\s//g")
    line_underscore=$(echo "${line,,}" | sed "s/\s/_/g")
    if (! ((${i} % 5)) ) && ((${i} != 0)); then
        echo '            </div>' >> skills.html
        echo '            <div class="sheet-table-row">' >> skills.html
    fi
    if [[ "${line}" == "BLANK" ]]; then
        echo '                <div class="sheet-table-cell sheet-cell-a"></div>'>> skills.html
    else
        echo '                <div class="sheet-table-cell sheet-cell-a"><input type="checkbox" class="sheet-ep2-skill-'"${line_underscore}"'" name="attr_EPv2Skill-Hider-'"${line_nospaces}"'" /> '"${line}"' </div>' >> skills.html
    fi
    ((i+=1))
done < ./skills_list.txt

echo '            </div>
        </div>
        <p style="text-align:center; font-style: italic">Use gear icon in "Eclipse Phase v2 Skills" header to hide</p>
    </div>
</div><!-- End Eclipse Phase v2 Skills -->' >> skills.html
