#!/usr/bin/env bash

set -e

skillsList=(
  "Acrobatics"
  "Appraise"
  "Bluff"
  "Climb"
  # "Craft"
  "Diplomacy"
  "Disable Device"
  "Disguise"
  "Escape Artist"
  "Fly"
  "Handle Animal"
  "Heal"
  "Intimidate"
  # "Knwoledge"
  # "Knowledge (Arcana)"
  # "Knowledge (Dungeoneering)"
  # "Knowledge (Engineering)"
  # "Knowledge (Geography)"
  # "Knowledge (History)"
  # "Knowledge (Local)"
  # "Knowledge (Nature)"
  # "Knowledge (Nobility)"
  # "Knowledge (Planes)"
  # "Knowledge (Religion)"
  "Linguistics"
  "Perception"
  "Perform"
  # "Profession"
  "Ride"
  "Sense Motive"
  "Sleight of Hand"
  "Spellcraft"
  "Stealth"
  "Survival"
  "Swim"
  "Use Magic Device"
)

declare -A skillsAry
skillsAry["Acrobatics"]="dex"
skillsAry["Appraise"]="int"
skillsAry["Bluff"]="cha"
skillsAry["Climb"]="str"
# skillsAry["Craft"]="int"
skillsAry["Diplomacy"]="cha"
skillsAry["Disable Device"]="dex"
skillsAry["Disguise"]="cha"
skillsAry["Escape Artist"]="dex"
skillsAry["Fly"]="dex"
skillsAry["Handle Animal"]="cha"
skillsAry["Heal"]="wis"
skillsAry["Intimidate"]="cha"
# skillsAry["Knowledge"]="int"
# skillsAry["Knowledge (Arcana)"]="int"
# skillsAry["Knowledge (Dungeoneering)"]="int"
# skillsAry["Knowledge (Engineering)"]="int"
# skillsAry["Knowledge (Geography)"]="int"
# skillsAry["Knowledge (History)"]="int"
# skillsAry["Knowledge (Local)"]="int"
# skillsAry["Knowledge (Nature)"]="int"
# skillsAry["Knowledge (Nobility)"]="int"
# skillsAry["Knowledge (Planes)"]="int"
# skillsAry["Knowledge (Religion)"]="int"
skillsAry["Linguistics"]="int"
skillsAry["Perception"]="wis"
skillsAry["Perform"]="cha"
# skillsAry["Profession"]="wis"
skillsAry["Ride"]="dex"
skillsAry["Sense Motive"]="wis"
skillsAry["Sleight of Hand"]="dex"
skillsAry["Spellcraft"]="int"
skillsAry["Stealth"]="dex"
skillsAry["Survival"]="wis"
skillsAry["Swim"]="str"
skillsAry["Use Magic Device"]="cha"

if [[ -f ./pf1e_skills.html ]]; then
  rm -f ./pf1e_skills.html
fi

if [[ -f ./pf1e_skills_workers.html ]]; then
  rm -f ./pf1e_skills_workers.html
fi

touch ./pf1e_skills.html
touch ./pf1e_skills_workers.html

i=0
for skill in "${skillsList[@]}"; do
  i=$((i + 1))
  # Remove all spaces and capitalize each word
  skillCamel=$(echo "${skill}" | awk '{ for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2)); }1')
  # Remove all spaces from the string
  skillCamel=${skillCamel// /}

  if [[ $i -eq 1 ]]; then
    echo "      <div class=\"sheet-table sheet-boldCenter sheet-input-border\">
        <div class=\"sheet-table-row\">
          <div class=\"sheet-table-cell sheet-cell-button\"></div>
          <div class=\"sheet-table-cell sheet-cell-a\">Skill</div>
          <div class=\"sheet-table-cell sheet-cell-rank\" title=\"Total Skill Bonus\">Total</div>
          <div class=\"sheet-table-cell sheet-cell-rank\" title=\"Ability Score Modifier\">Abl.</div>
          <div class=\"sheet-table-cell sheet-cell-rank\" title=\"Skill Ranks\">Ranks</div>
          <div class=\"sheet-table-cell sheet-cell-rank\" title=\"Misc. Skill Bonus 1\">Bonus</div>
          <div class=\"sheet-table-cell sheet-cell-rank\" title=\"Misc. Skill Bonus 2\">Bonus</div>
          <div class=\"sheet-table-cell sheet-cell-rank\" title=\"Misc. Skill Bonus 3\">Bonus</div>
          <div class=\"sheet-table-cell sheet-cell-rank\" title=\"Misc. Skill Bonus 4\">Bonus</div>
          <div class=\"sheet-table-cell sheet-cell-rank\" title=\"Class Skill?\">Class?</div>
          <div class=\"sheet-table-cell sheet-cell-a\"></div>
        </div>" >>./pf1e_skills.html
  fi

  echo "        <div class=\"sheet-table-row\">
          <div class=\"sheet-table-cell\" title=\"${skill} (${skillsAry[$skill]^^}) Roller\">
            <button type=\"roll\" name=\"pf1e-${skill,,}-skill-roll\" value=\"[[@{DiceBase}+@{PF1e${skillCamel}Total}]]\"></button>
          </div>
          <div class=\"sheet-table-cell\" title=\"${skill} (${skillsAry[$skill]^^})\" style=\"text-align: left;\">
            ${skill} (${skillsAry[$skill]^^}):
          </div>
          <div class=\"sheet-table-cell sheet-input-disabled\" title=\"${skill} Total Bonus\">
            <input type=\"number\" name=\"attr_PF1e${skillCamel}Total\" value=\"0\" readonly/>
          </div>
          <div class=\"sheet-table-cell sheet-input-disabled\" title=\"${skillsAry[$skill]^^} Mod\">
            <input type=\"number\" name=\"attr_d20${skillsAry[$skill]}Mod\" value=\"0\" readonly/>
          </div>
          <div class=\"sheet-table-cell\" title=\"${skill} Ranks\">
            <input type=\"number\" name=\"attr_PF1e${skillCamel}Ranks\" value=\"0\" />
          </div>
          <div class=\"sheet-table-cell\" title=\"${skill} Bonus 1\">
            <input type=\"number\" name=\"attr_PF1e${skillCamel}Bonus1\" value=\"0\" />
          </div>
          <div class=\"sheet-table-cell\" title=\"${skill} Bonus 2\">
            <input type=\"number\" name=\"attr_PF1e${skillCamel}Bonus2\" value=\"0\" />
          </div>
          <div class=\"sheet-table-cell\" title=\"${skill} Bonus 3\">
            <input type=\"number\" name=\"attr_PF1e${skillCamel}Bonus3\" value=\"0\" />
          </div>
          <div class=\"sheet-table-cell\" title=\"${skill} Bonus 4\">
            <input type=\"number\" name=\"attr_PF1e${skillCamel}Bonus4\" value=\"0\" />
          </div>
          <div class=\"sheet-table-cell sheet-cell-button\" title=\"Class Skill?\">
            <input type=\"checkbox\" name=\"attr_PF1e${skillCamel}ClassSkillCheckbox\" value=\"1\">
          </div>
          <div class=\"sheet-table-cell\"></div>
        </div>" >>./pf1e_skills.html

  echo "<!-- PF1E ${skill} Calculation -->
<script type=\"text/worker\">
  on(\"ready change:d20${skillsAry[$skill]}Mod change:PF1e${skillCamel}Ranks change:PF1e${skillCamel}Bonus1 change:PF1e${skillCamel}Bonus2 change:PF1e${skillCamel}Bonus3 change:PF1e${skillCamel}Bonus4 change:PF1e${skillCamel}ClassSkillCheckbox\",
    function(){
      const skillMods = [
        \"PF1e${skillCamel}Total\",
        \"d20${skillsAry[$skill]}Mod\",
        \"PF1e${skillCamel}Ranks\",
        \"PF1e${skillCamel}Bonus1\",
        \"PF1e${skillCamel}Bonus2\",
        \"PF1e${skillCamel}Bonus3\",
        \"PF1e${skillCamel}Bonus4\",
        \"PF1e${skillCamel}ClassSkillCheckbox\"
      ]
      getAttrs(skillMods, function(values){
        let mod = parseInt(values.d20${skillsAry[$skill]}Mod) || 0;
        let ranks = parseInt(values.PF1e${skillCamel}Ranks) || 0;
        let bonus1 = parseInt(values.PF1e${skillCamel}Bonus1) || 0;
        let bonus2 = parseInt(values.PF1e${skillCamel}Bonus2) || 0;
        let bonus3 = parseInt(values.PF1e${skillCamel}Bonus3) || 0;
        let bonus4 = parseInt(values.PF1e${skillCamel}Bonus4) || 0;
        let classCheck = values.PF1e${skillCamel}ClassSkillCheckbox === \"1\" ? true : false;
        let classSkill = 0;

        if (classCheck) {
          classSkill = 3;
        } else {
          classSkill = 0;
        }

        let total = mod + ranks + bonus1 + bonus2 + bonus3 +bonus4 + classSkill;
        setAttrs({PF1e${skillCamel}Total: total});
      });
    }
  );
</script>" >>./pf1e_skills_workers.html
  # echo "${i} ${skill}: ${skillsAry[$skill]}"
done

echo "      </div>" >>./pf1e_skills.html
