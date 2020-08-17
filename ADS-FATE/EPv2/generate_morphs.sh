#!/usr/bin/env bash

set -e

if [[ -f morphs.html ]]; then
    rm -f morphs.html
fi

echo '<!-- Eclipse Phase v2 Morphs Section -->
<input type="checkbox" class="sheet-special-gear-epv2_morphs sheet-hider-invis" name="attr_SpecialGear-EPv2_Morphs" value="EPv2_Morphs-Yes" checked />
<div class="sheet-special-gear-section-epv2_morphs sheet-section">
    <div class="sheet-headerbar">Eclipse Phase v2 Morphs</div>

    <input type="radio" class="sheet-epv2_morph-tab sheet-epv2_morphs-select-morph1" name="attr_EPv2v2-morphs-tab" value="Morph_1" title="Morph 1" checked />
    <span class="sheet-epv2_morph-tab sheet-epv2_morphs-tab-morph1">Morph 1</span>

    <input type="radio" class="sheet-epv2_morph-tab sheet-epv2_morphs-select-morph2" name="attr_EPv2v2-morphs-tab" value="Morph_2" title="Morph 2" />
    <span class="sheet-epv2_morph-tab sheet-epv2_morphs-tab-morph2">Morph 2</span>

    <input type="radio" class="sheet-epv2_morph-tab sheet-epv2_morphs-select-morph3" name="attr_EPv2v2-morphs-tab" value="Morph_3" title="Morph 3" />
    <span class="sheet-epv2_morph-tab sheet-epv2_morphs-tab-morph3">Morph 3</span>

    <input type="radio" class="sheet-epv2_morph-tab sheet-epv2_morphs-select-morph4" name="attr_EPv2v2-morphs-tab" value="Morph_4" title="Morph 4" />
    <span class="sheet-epv2_morph-tab sheet-epv2_morphs-tab-morph4">Morph 4</span>

    <input type="radio" class="sheet-epv2_morph-tab sheet-epv2_morphs-select-morph5" name="attr_EPv2v2-morphs-tab" value="Morph_5" title="Morph 5" />
    <span class="sheet-epv2_morph-tab sheet-epv2_morphs-tab-morph5">Morph 5</span>
'>> morphs.html

for i in 1 2 3 4 5; do
    echo '    <div class="sheet-epv2_morphs-section-morph'"${i}"' sheet-topBorderGray">
        <div class="sheet-table">
            <div class="sheet-table-row sheet-input-border sheet-cell-boldRight">
                <div class="sheet-table-cell sheet-cell-18" style="text-align:left" title="Morph '"${i}"' Name/Model">Morph '"${i}"' Name/Model:</div>
                <div class="sheet-table-cell sheet-cell-a" title="Morph '"${i}"' Name/Model"><input type="text" name="attr_EPv2Morph'"${i}"'Name" placeholder="Morph '"${i}"' Name/Model (no numbers!)" value="Morph Name/Model (no numbers!)"/></div>
                <div class="sheet-table-cell sheet-cell-5" title="Morph '"${i}"' Type">Type:</div>
                <div class="sheet-table-cell sheet-cell-8" title="Morph '"${i}"' Type">
                    <select name="attr_EPv2Morph'"${i}"'Type">
                        <option value="1.5" selected>Bio</option>
                        <option value="2">Synth</option>
                    </select>
                </div>
                <div class="sheet-table-cell sheet-cell-5" title="Morph '"${i}"' Sex">Sex:</div>
                <div class="sheet-table-cell sheet-cell-10" title="Morph '"${i}"' Sex"><input type="text" name="attr_EPv2Morph'"${i}"'Sex" placeholder="Sex" /></div>
                <div class="sheet-table-cell sheet-cell-5" title="Morph '"${i}"' apparent age">Age:</div>
                <div class="sheet-table-cell sheet-cell-5" title="Morph '"${i}"' apparent age"><input type="number" name="attr_EPv2Morph'"${i}"'Age" value="0" /></div>
                <div class="sheet-table-cell sheet-cell-10" title="Morph '"${i}"' aptitude maximum">Apt Max:</div>
                <div class="sheet-table-cell sheet-cell-5" title="Morph '"${i}"' aptitude maximum"><input type="number" name="attr_EPv2Morph'"${i}"'AptMax" value="30" /></div>
            </div>
        </div>
        <div class="sheet-table">
            <div class="sheet-table-row sheet-input-border sheet-cell-boldRight">
                <div class="sheet-table-cell sheet-cell-18" style="text-align:left" title="Click me to show/hide appearance details">Appearance/Desc <input type="checkbox" class="sheet-checkbox-graygear" name="attr_EPv2Morph'"${i}"'Appearance-Hider" checked /><span/></div>
                <div class="sheet-table-cell sheet-cell-10" title="Morph '"${i}"' durability">Durability:</div>
                <div class="sheet-table-cell sheet-cell-5" title="Morph '"${i}"' durability"><input type="number" name="attr_EPv2Morph'"${i}"'Dur" value="0" /></div>
                <div class="sheet-table-cell sheet-cell-5" title="Morph '"${i}"' Wound Threshold (DUR ÷ 5)">WT:</div>
                <div class="sheet-table-cell sheet-cell-5" title="Morph '"${i}"' Wound Threshold (DUR ÷ 5)"><input type="number" name="attr_EPv2Morph'"${i}"'WT" value="[[@{EPv2Morph'"${i}"'Dur}/5]]" disabled="disabled"/></div>
                <div class="sheet-table-cell sheet-cell-5" title="Morph '"${i}"' Death Rating: Bio=DUR*1.5; Synth=DUR*2"">DR:</div>
                <div class="sheet-table-cell sheet-cell-5" title="Morph '"${i}"' Death Rating: Bio=DUR*1.5; Synth=DUR*2""><input type="number" name="attr_EPv2Morph'"${i}"'DR" value="[[@{EPv2Morph'"${i}"'Dur}*@{EPv2Morph'"${i}"'Type}]]" disabled="disabled"/></div>
                <div class="sheet-table-cell sheet-cell-10" title="Morph '"${i}"' speed modifier">Speed Mod:</div>
                <div class="sheet-table-cell sheet-cell-5" title="Morph '"${i}"' speed modifier"><input type="number" name="attr_EPv2Morph'"${i}"'SpdMod" value="0" /></div>
                <div class="sheet-table-cell sheet-cell-15" title="Morph '"${i}"' Movement rate/mobility system">Mov Rate/Type:</div>
                <div class="sheet-table-cell sheet-cell-a" title="Morph '"${i}"' Movement rate/mobility system"><input type="text" name="attr_EPv2Morph'"${i}"'MovType" /></div>
            </div>
        </div>
        <input type="checkbox" class="sheet-hider sheet-hider-invis" name="attr_EPv2Morph'"${i}"'Appearance-Hider" checked />
        <div class="sheet-hide-section">
            <textarea class="sheet-multiline-input sheet-input-border" name="attr_attr_EPv2Morph'"${i}"'-Appearance-Details" placeholder="Morph '"${i}"' Appearance/Description"></textarea>
        </div>
        <br>
        <div><!-- Eclipse Phase v2 Morph '"${i}"' Aptitude and Pool Bonuses -->
            <div class="sheet-boldCenter sheet-topBorderGray" style="padding-top:3px">Morph '"${i}"' Aptitude and Pool Bonuses</div>
            <div class="sheet-table sheet-input-border">
                <div class="sheet-table-row sheet-cell-boldRight">
                    <div class="sheet-table-cell sheet-cell-5" title="Cognition - morph total bonus">COG:</div>
                    <div class="sheet-table-cell sheet-cell-3 sheet-input-disabled" title="Cognition">
                        <input type="number" name="attr_EPv2Morph'"${i}"'CogBonusTotal" value="[[@{EPv2Morph'"${i}"'CogBonusBase}+@{EPv2Morph'"${i}"'CogBonusMisc}]]" disabled /> </div>
                    <div class="sheet-table-cell sheet-cell-5" title="Intuition - morph total bonus">INT:</div>
                    <div class="sheet-table-cell sheet-cell-3 sheet-input-disabled" title="Intuition">
                        <input type="number" name="attr_EPv2Morph'"${i}"'IntBonusTotal" value="[[@{EPv2Morph'"${i}"'IntBonusBase}+@{EPv2Morph'"${i}"'IntBonusMisc}]]" disabled /></div>
                    <div class="sheet-table-cell sheet-cell-5" title="Reflexes - morph total bonus">REF:</div>
                    <div class="sheet-table-cell sheet-cell-3 sheet-input-disabled" title="Reflexes">
                        <input type="number" name="attr_EPv2Morph'"${i}"'RefBonusTotal" value="[[@{EPv2Morph'"${i}"'RefBonusBase}+@{EPv2Morph'"${i}"'RefBonusMisc}]]" disabled /></div>
                    <div class="sheet-table-cell sheet-cell-5" title="Savvy - morph total bonus">SAV:</div>
                    <div class="sheet-table-cell sheet-cell-3 sheet-input-disabled" title="Savvy">
                        <input type="number" name="attr_EPv2Morph'"${i}"'SavBonusTotal" value="[[@{EPv2Morph'"${i}"'SavBonusBase}+@{EPv2Morph'"${i}"'SavBonusMisc}]]" disabled /></div>
                    <div class="sheet-table-cell sheet-cell-5" title="Somatics - morph total bonus">SOM:</div>
                    <div class="sheet-table-cell sheet-cell-3 sheet-input-disabled" title="Somatics">
                        <input type="number" name="attr_EPv2Morph'"${i}"'SomBonusTotal" value="[[@{EPv2Morph'"${i}"'SomBonusBase}+@{EPv2Morph'"${i}"'SomBonusMisc}]]" disabled /></div>
                    <div class="sheet-table-cell sheet-cell-5" title="Willpower - morph total bonus">WIL:</div>
                    <div class="sheet-table-cell sheet-cell-3 sheet-input-disabled" title="Willpower">
                        <input type="number" name="attr_EPv2Morph'"${i}"'WilBonusTotal" value="[[@{EPv2Morph'"${i}"'WilBonusBase}+@{EPv2Morph'"${i}"'WilBonusMisc}]]" disabled /></div>
                    <div class="sheet-table-cell sheet-cell-a"></div>

                    <div class="sheet-table-cell sheet-cell-7" title="Insight - morph total bonus">Insight:</div>
                    <div class="sheet-table-cell sheet-cell-3 sheet-input-disabled" title="Insight">
                        <input type="number" name="attr_EPv2Morph'"${i}"'InsightBonusTotal" value="[[@{EPv2Morph'"${i}"'InsightBonusBase}+@{EPv2Morph'"${i}"'InsightBonusMisc}]]" disabled /></div>
                    <div class="sheet-table-cell sheet-cell-7" title="Moxie - morph total bonus">Moxie:</div>
                    <div class="sheet-table-cell sheet-cell-3 sheet-input-disabled" title="Moxie">
                        <input type="number" name="attr_EPv2Morph'"${i}"'MoxieBonusTotal" value="[[@{EPv2Morph'"${i}"'MoxieBonusBase}+@{EPv2Morph'"${i}"'MoxieBonusMisc}]]" disabled /></div>
                    <div class="sheet-table-cell sheet-cell-7" title="Vigor - morph total bonus">Vigor:</div>
                    <div class="sheet-table-cell sheet-cell-3 sheet-input-disabled" title="Vigor">
                        <input type="number" name="attr_EPv2Morph'"${i}"'VigorBonusTotal" value="[[@{EPv2Morph'"${i}"'VigorBonusBase}+@{EPv2Morph'"${i}"'VigorBonusMisc}]]" disabled /></div>
                    <div class="sheet-table-cell sheet-cell-7" title="Flex - morph total bonus">Flex:</div>
                    <div class="sheet-table-cell sheet-cell-3 sheet-input-disabled" title="Flex">
                        <input type="number" name="attr_EPv2Morph'"${i}"'FlexBonusTotal" value="[[@{EPv2Morph'"${i}"'FlexBonusBase}+@{EPv2Morph'"${i}"'FlexBonusMisc}]]" disabled /></div>
                    <div class="sheet-table-cell sheet-cell-button" title="Click me to show/hide input cells"><input type="checkbox" class="sheet-checkbox-graygear" name="attr_EPv2Morph'"${i}"'Apt-Bonus-Hider" checked /><span/></div>
                </div>
            </div>
            <input type="checkbox" class="sheet-hider sheet-hider-invis" name="attr_EPv2Morph'"${i}"'Apt-Bonus-Hider" checked />
            <div class="sheet-hide-section">
                <div class="sheet-table sheet-input-border">
                    <div class="sheet-table-row" style="text-align:right">
                        <div class="sheet-table-cell sheet-cell-5" title="Cognition base Aptitude bonus from Morph">Base:</div>
                        <div class="sheet-table-cell sheet-cell-3" title="Cognition base Aptitude bonus from Morph">
                            <input type="number" name="attr_EPv2Morph'"${i}"'CogBonusBase" value="0" /> </div>
                        <div class="sheet-table-cell sheet-cell-5" title="Intuition base Aptitude bonus from Morph">Base:</div>
                        <div class="sheet-table-cell sheet-cell-3" title="Intuition base Aptitude bonus from Morph">
                            <input type="number" name="attr_EPv2Morph'"${i}"'IntBonusBase" value="0" /></div>
                        <div class="sheet-table-cell sheet-cell-5" title="Reflexes base Aptitude bonus from Morph">Base:</div>
                        <div class="sheet-table-cell sheet-cell-3" title="Reflexes base Aptitude bonus from Morph">
                            <input type="number" name="attr_EPv2Morph'"${i}"'RefBonusBase" value="0" /></div>
                        <div class="sheet-table-cell sheet-cell-5" title="Savvy base Aptitude bonus from Morph">Base:</div>
                        <div class="sheet-table-cell sheet-cell-3" title="Savvy base Aptitude bonus from Morph">
                            <input type="number" name="attr_EPv2Morph'"${i}"'SavBonusBase" value="0" /></div>
                        <div class="sheet-table-cell sheet-cell-5" title="Somatics base Aptitude bonus from Morph">Base:</div>
                        <div class="sheet-table-cell sheet-cell-3" title="Somatics base Aptitude bonus from Morph">
                            <input type="number" name="attr_EPv2Morph'"${i}"'SomBonusBase" value="0"/></div>
                        <div class="sheet-table-cell sheet-cell-5" title="Willpower base Aptitude bonus from Morph">Base:</div>
                        <div class="sheet-table-cell sheet-cell-3" title="Willpower base Aptitude bonus from Morph">
                            <input type="number" name="attr_EPv2Morph'"${i}"'WilBonusBase" value="0" /></div>
                        <div class="sheet-table-cell sheet-cell-a"></div>
                        <div class="sheet-table-cell sheet-cell-7" title="Insight pool base bonus from Morph">Base:</div>
                        <div class="sheet-table-cell sheet-cell-3" title="Insight pool base bonus from Morph">
                            <input type="number" name="attr_EPv2Morph'"${i}"'InsightBonusBase" value="0" /></div>
                        <div class="sheet-table-cell sheet-cell-7" title="Moxie pool base bonus from Morph">Base:</div>
                        <div class="sheet-table-cell sheet-cell-3" title="Moxie pool base bonus from Morph">
                            <input type="number" name="attr_EPv2Morph'"${i}"'MoxieBonusBase" value="0" /></div>
                        <div class="sheet-table-cell sheet-cell-7" title="Vigor pool base bonus from Morph">Base:</div>
                        <div class="sheet-table-cell sheet-cell-3" title="Vigor pool base bonus from Morph">
                            <input type="number" name="attr_EPv2Morph'"${i}"'VigorBonusBase" value="0" /></div>
                        <div class="sheet-table-cell sheet-cell-7" title="Flex pool base bonus from Morph">Base:</div>
                        <div class="sheet-table-cell sheet-cell-3" title="Flex pool base bonus from Morph">
                            <input type="number" name="attr_EPv2Morph'"${i}"'FlexBonusBase" value="0" /></div>
                        <div class="sheet-table-cell sheet-cell-button"></div>
                    </div>
                    <div class="sheet-table-row" style="text-align:right">
                        <div class="sheet-table-cell sheet-cell-5" title="Cognition misc. Aptitude bonus from Morph">Misc:</div>
                        <div class="sheet-table-cell sheet-cell-3" title="Cognition misc. Aptitude bonus from Morph">
                            <input type="number" name="attr_EPv2Morph'"${i}"'CogBonusMisc" value="0" /> </div>
                        <div class="sheet-table-cell sheet-cell-5" title="Intuition misc. Aptitude bonus from Morph">Misc:</div>
                        <div class="sheet-table-cell sheet-cell-3" title="Intuition misc. Aptitude bonus from Morph">
                            <input type="number" name="attr_EPv2Morph'"${i}"'IntBonusMisc" value="0" /></div>
                        <div class="sheet-table-cell sheet-cell-5" title="Reflexes misc. Aptitude bonus from Morph">Misc:</div>
                        <div class="sheet-table-cell sheet-cell-3" title="Reflexes misc. Aptitude bonus from Morph">
                            <input type="number" name="attr_EPv2Morph'"${i}"'RefBonusMisc" value="0" /></div>
                        <div class="sheet-table-cell sheet-cell-5" title="Savvy misc. Aptitude bonus from Morph">Misc:</div>
                        <div class="sheet-table-cell sheet-cell-3" title="Savvy misc. Aptitude bonus from Morph">
                            <input type="number" name="attr_EPv2Morph'"${i}"'SavBonusMisc" value="0" /></div>
                        <div class="sheet-table-cell sheet-cell-5" title="Somatics misc. Aptitude bonus from Morph">Misc:</div>
                        <div class="sheet-table-cell sheet-cell-3" title="Somatics misc. Aptitude bonus from Morph">
                            <input type="number" name="attr_EPv2Morph'"${i}"'SomBonusMisc" value="0"/></div>
                        <div class="sheet-table-cell sheet-cell-5" title="Willpower misc. Aptitude bonus from Morph">Misc:</div>
                        <div class="sheet-table-cell sheet-cell-3" title="Willpower misc. Aptitude bonus from Morph">
                            <input type="number" name="attr_EPv2Morph'"${i}"'WilBonusMisc" value="0" /></div>
                        <div class="sheet-table-cell sheet-cell-a"></div>
                        <div class="sheet-table-cell sheet-cell-7" title="Insight pool misc. bonus from Morph">Misc:</div>
                        <div class="sheet-table-cell sheet-cell-3" title="Insight pool misc. bonus from Morph">
                            <input type="number" name="attr_EPv2Morph'"${i}"'InsightBonusMisc" value="0" /></div>
                        <div class="sheet-table-cell sheet-cell-7" title="Moxie pool misc. bonus from Morph">Misc:</div>
                        <div class="sheet-table-cell sheet-cell-3" title="Moxie pool misc. bonus from Morph">
                            <input type="number" name="attr_EPv2Morph'"${i}"'MoxieBonusMisc" value="0" /></div>
                        <div class="sheet-table-cell sheet-cell-7" title="Vigor pool misc. bonus from Morph">Misc:</div>
                        <div class="sheet-table-cell sheet-cell-3" title="Vigor pool misc. bonus from Morph">
                            <input type="number" name="attr_EPv2Morph'"${i}"'VigorBonusMisc" value="0" /></div>
                        <div class="sheet-table-cell sheet-cell-7" title="Flex pool misc. bonus from Morph">Misc:</div>
                        <div class="sheet-table-cell sheet-cell-3" title="Flex pool misc. bonus from Morph">
                            <input type="number" name="attr_EPv2Morph'"${i}"'FlexBonusMisc" value="0" /></div>
                        <div class="sheet-table-cell sheet-cell-button"></div>
                    </div>
                </div>
            </div>
        </div><!-- END Eclipse Phase v2 Morph '"${i}"' Aptitude and Pool Bonuses -->
        <br>
        <div><!-- Eclipse Phase v2 Morph '"${i}"' Skill Bonues -->
            <div class="sheet-boldCenter sheet-topBorderGray" style="padding-top:3px">Morph '"${i}"' Skill Bonuses<input type="checkbox" class="sheet-checkbox-graygear" name="attr_EPv2Morph'"${i}"'Skill-Bonus-Hider" checked /><span/></div>
            <input type="checkbox" class="sheet-hider sheet-hider-invis" name="attr_EPv2Morph'"${i}"'Skill-Bonus-Hider" checked />
            <div class="sheet-table sheet-hide-section sheet-input-border" style="text-align:center">
                <div class="sheet-table-row sheet-boldCenter">
                    <div class="sheet-table-cell sheet-cell-a">Skill</div>
                    <div class="sheet-table-cell sheet-cell-rank">Bonus</div>
                    <div class="sheet-table-cell sheet-cell-a">Skill</div>
                    <div class="sheet-table-cell sheet-cell-rank">Bonus</div>
                    <div class="sheet-table-cell sheet-cell-a">Skill</div>
                    <div class="sheet-table-cell sheet-cell-rank">Bonus</div>
                    <div class="sheet-table-cell sheet-cell-a">Skill</div>
                    <div class="sheet-table-cell sheet-cell-rank">Bonus</div>
                    <div class="sheet-table-cell sheet-cell-a">Skill</div>
                    <div class="sheet-table-cell sheet-cell-rank">Bonus</div>
                </div>
                <div class="sheet-table-row">' >> morphs.html
    j=0
    while read line; do
        line_nospaces=$(echo "${line}" | sed "s/\s//g")
        line_underscore=$(echo "${line,,}" | sed "s/\s/_/g")
        if (! ((${j} % 5)) ) && ((${j} != 0)); then
            echo '                </div>' >> morphs.html
            echo '                <div class="sheet-table-row">' >> morphs.html
        fi
        if [[ "${line}" == "BLANK" ]]; then
            echo '                    <div class="sheet-table-cell sheet-cell-a"></div>
                    <div class="sheet-table-cell sheet-cell-a"></div>'>> morphs.html
        else
            echo '                    <div class="sheet-table-cell" title="EPv2 Morph'"${i} ${line}"' bonus">'"${line}"':</div>
                    <div class="sheet-table-cell" title="EPv2 Morph'"${i} ${line}"' bonus"><input type="number" name="attr_EPv2Morph'"${i}"'SkillBonus_'"${line_nospaces}"'" value="0" /></div>' >> morphs.html
        fi
        ((j+=1))
    done < ./skills_list.txt
    echo '              </div>
            </div>
        </div><!-- END Eclipse Phase v2 Morph '"${i}"' Skill Bonues -->
        <br>

        <!-- Eclipse Phase v2 Morph '"${i}"' Traits Repeating -->
        <div class="sheet-boldCenter sheet-topBorderGray" style="padding-top:3px">Morph '"${i}"' Pos & Neg Traits / Advantages/Disadvantages</div>
        <fieldset class="repeating_Morph'"${i}"'-Traits">
            <div class="sheet-table">
                <div class="sheet-table-row sheet-input-border">
                    <div class="sheet-table-cell sheet-cell-button"><button type="roll"></button></div>
                    <div class="sheet-table-cell sheet-cell-5 sheet-span-settings-label">Trait:</div>
                    <div class="sheet-table-cell sheet-cell-a"><input type="text" class="sheet-boldCenter" name="attr_EPv2Morph'"${i}"'Trait-Name-Repeating" placeholder="Morph '"${i}"' Trait" /></div>
                    <div class="sheet-table-cell sheet-cell-button"><input type="checkbox" class="sheet-checkbox-graygear" name="attr_EPv2Morph'"${i}"'Trait-Details-Hider" checked /><span/></div>
                </div>
            </div>
            <div>
                <input type="checkbox" class="sheet-hider sheet-hider-invis" name="attr_EPv2Morph'"${i}"'Trait-Details-Hider" checked />
                <div class="sheet-hide-section">
                    <textarea class="sheet-multiline-input" name="attr_EPv2Morph'"${i}"'Trait-Details" placeholder="Morph '"${i}"' Trait Details"></textarea>
                </div>
            </div>
        </fieldset><!-- End Eclipse Phase v2 Morph '"${i}"' Traits Repeating -->
        <br>

        <!-- Eclipse Phase v2 Morph '"${i}"' Enhancements Repeating -->
        <div class="sheet-boldCenter sheet-topBorderGray" style="padding-top:3px">Morph '"${i}"' Implants / Enhancements / Customizations</div>
        <fieldset class="repeating_Morph'"${i}"'-Enhancements">
            <div class="sheet-table">
                <div class="sheet-table-row sheet-input-border">
                    <div class="sheet-table-cell sheet-cell-button"><button type="roll"></button></div>
                    <div class="sheet-table-cell sheet-cell-12 sheet-span-settings-label">Enhancement:</div>
                    <div class="sheet-table-cell sheet-cell-a"><input type="text" class="sheet-boldCenter" name="attr_EPv2Morph'"${i}"'Enhancement-Name-Repeating" placeholder="Morph '"${i}"' Enhancement" /></div>
                    <div class="sheet-table-cell sheet-cell-button"><input type="checkbox" class="sheet-checkbox-graygear" name="attr_EPv2Morph'"${i}"'Enhancement-Details-Hider" checked /><span/></div>
                </div>
            </div>
            <div>
                <input type="checkbox" class="sheet-hider sheet-hider-invis" name="attr_EPv2Morph'"${i}"'Enhancement-Details-Hider" checked />
                <div class="sheet-hide-section">
                    <textarea class="sheet-multiline-input" name="attr_EPv2Morph'"${i}"'Enhancement-Details" placeholder="Morph '"${i}"' Enhancement Details"></textarea>
                </div>
            </div>
        </fieldset><!-- End Eclipse Phase v2 Morph '"${i}"' Enhancements Repeating -->
    </div>
'>> morphs.html
done

sed -i '$ d' morphs.html
echo '</div> <!-- End Eclipse Phase v2 Morphs Section -->'>> morphs.html
