#!/usr/bin/env bash

set -e

if [[ -f script_workers.html ]]; then
    rm -f script_workers.html
fi

echo '<!-- Eclipse Phase v2 Script Workers -->
<script type="text/worker">
    on("ready change:EPv2CurrentSelectedMorph change:EPv2Morph1Name change:EPv2Morph2Name change:EPv2Morph3Name change:EPv2Morph4Name change:EPv2Morph5Name change:EPv2Morph1Dur change:EPv2Morph2Dur change:EPv2Morph3Dur change:EPv2Morph4Dur change:EPv2Morph5Dur change:EPv2Morph1DR change:EPv2Morph2DR change:EPv2Morph3DR change:EPv2Morph4DR change:EPv2Morph5DR",
        function(){
            const morphProps = [
                "EPv2CurrentSelectedMorph", "EPv2MorphsCurrentMorphName",
                "EPv2Morph1Name", "EPv2Morph2Name", "EPv2Morph3Name", "EPv2Morph4Name", "EPv2Morph5Name",
                "EPv2DUR", "EPv2Morph1Dur", "EPv2Morph2Dur", "EPv2Morph3Dur", "EPv2Morph4Dur", "EPv2Morph5Dur",
                "EPv2DR", "EPv2Morph1DR", "EPv2Morph2DR", "EPv2Morph3DR", "EPv2Morph4DR", "EPv2Morph5DR"
            ]
            getAttrs(morphProps, function(values){' >> script_workers.html
for i in 1 2 3 4 5; do
    if ((i==1)); then
        leader="if"
    else
        leader="} else if"
    fi
        echo '                '"${leader}"' (values.EPv2CurrentSelectedMorph == '"${i}"'){
                    setAttrs({
                        EPv2MorphsCurrentMorphName: values.EPv2Morph'"${i}"'Name,
                        EPv2DUR: values.EPv2Morph'"${i}"'Dur,
                        EPv2DR: values.EPv2Morph'"${i}"'DR
                    });' >> script_workers.html
done
echo '                }
            });
        }
    );
</script>' >> script_workers.html

while read line; do
    if [[ ! -z "${line}" ]]; then
        IFS=':' read -ra line_ary <<< "${line}"
        line_nospaces=$(echo "${line_ary[0]}" | sed "s/\s//g")
        line_underscore=$(echo "${line_ary[0],,}" | sed "s/\s/_/g")

        echo '
<script type="text/worker">
    on("ready change:EPv2CurrentSelectedMorph change:EPv2Morph1SkillBonus'"${line_nospaces}"' change:EPv2Morph2SkillBonus'"${line_nospaces}"' change:EPv2Morph3SkillBonus'"${line_nospaces}"' change:EPv2Morph4SkillBonus'"${line_nospaces}"' change:EPv2Morph5SkillBonus'"${line_nospaces}"'",
        function(){
            const morph'"${line_nospaces}"'Props = [
                "EPv2CurrentSelectedMorph", "EP2Skill'"${line_nospaces}"'MorphBonus", "EPv2Morph1SkillBonus'"${line_nospaces}"'", "EPv2Morph2SkillBonus'"${line_nospaces}"'", "EPv2Morph3SkillBonus'"${line_nospaces}"'", "EPv2Morph4SkillBonus'"${line_nospaces}"'", "EPv2Morph5SkillBonus'"${line_nospaces}"'"
            ]
            getAttrs(morph'"${line_nospaces}"'Props, function(values){' >> script_workers.html
        for i in 1 2 3 4 5; do
            if ((i==1)); then
                leader="if"
            else
                leader="} else if"
            fi
            echo '                '"${leader}"' (values.EPv2CurrentSelectedMorph == '"${i}"'){
                    setAttrs({EP2Skill'"${line_nospaces}"'MorphBonus: values.EPv2Morph'"${i}"'SkillBonus'"${line_nospaces}"'});' >> script_workers.html
        done
        echo '                }
            });
        }
    );
</script>' >> script_workers.html
    fi
done < ./skills_list_alphabetical.txt

echo '<!-- END Eclipse Phase v2 Script Workers -->' >> script_workers.html
