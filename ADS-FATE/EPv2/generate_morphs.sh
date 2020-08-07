#!/usr/bin/env bash

set -e

if [[ -f morphs.html ]]; then
    rm -f morphs.html
fi

echo '<input type="checkbox" class="sheet-special-gear-epv2_morphs sheet-hider-invis" name="attr_SpecialGear-EPv2_Morphs" value="EPv2_Morphs-Yes" checked />
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
                <div class="sheet-table-cell sheet-cell-18" style="text-align:left">Morph '"${i}"' Name/Type:</div>
                <div class="sheet-table-cell sheet-cell-a"><input type="text" name="attr_EPv2-Morph'"${i}"'-Name" placeholder="Morph '"${i}"' name/type" /></div>
                <div class="sheet-table-cell sheet-cell-5" title="Morph '"${i}"' Sex">Sex:</div>
                <div class="sheet-table-cell sheet-cell-10" title="Morph '"${i}"' Sex"><input type="text" name="attr_EPv2-Morph'"${i}"'-Sex" placeholder="Morph '"${i}"' sex" /></div>
                <div class="sheet-table-cell sheet-cell-5" title="Morph '"${i}"' apparent age">Age:</div>
                <div class="sheet-table-cell sheet-cell-5" title="Morph '"${i}"' apparent age"><input type="number" name="attr_EPv2-Morph'"${i}"'-Age" value="0" /></div>
                <div class="sheet-table-cell sheet-cell-10" title="Morph '"${i}"' aptitude maximum">Apt Max:</div>
                <div class="sheet-table-cell sheet-cell-5" title="Morph '"${i}"' aptitude maximum"><input type="number" name="attr_EPv2-Morph'"${i}"'-AptMax" value="30" /></div>
            </div>
        </div>
        <div class="sheet-table">
            <div class="sheet-table-row sheet-input-border sheet-cell-boldRight">
                <div class="sheet-table-cell sheet-cell-18" style="text-align:left" title="Click me to show/hide appearance details">Appearance/Desc <input type="checkbox" class="sheet-checkbox-graygear" name="attr_EPv2-Morph'"${i}"'-Appearance-Hider" checked /><span/></div>
                <div class="sheet-table-cell sheet-cell-10" title="Morph '"${i}"' durability">Durability:</div>
                <div class="sheet-table-cell sheet-cell-5" title="Morph '"${i}"' durability"><input type="number" name="attr_EPv2-Morph'"${i}"'-Dur" value="0" /></div>
                <div class="sheet-table-cell sheet-cell-5" title="Morph '"${i}"' Wound Threshold">WT:</div>
                <div class="sheet-table-cell sheet-cell-5" title="Morph '"${i}"' Wound Threshold"><input type="number" name="attr_EPv2-Morph'"${i}"'-WT" value="0" /></div>
                <div class="sheet-table-cell sheet-cell-10" title="Morph '"${i}"' speed modifier">Speed Mod:</div>
                <div class="sheet-table-cell sheet-cell-5" title="Morph '"${i}"' speed modifier"><input type="number" name="attr_EPv2-Morph'"${i}"'-SpdMod" value="0" /></div>
                <div class="sheet-table-cell sheet-cell-15" title="Morph '"${i}"' Movement rate/mobility system">Mov Rate/Type:</div>
                <div class="sheet-table-cell sheet-cell-a" title="Morph '"${i}"' Movement rate/mobility system"><input type="text" name="attr_EPv2-Morph'"${i}"'-MovType" /></div>
            </div>
        </div>
        <input type="checkbox" class="sheet-hider sheet-hider-invis" name="attr_EPv2-Morph'"${i}"'-Appearance-Hider" checked />
        <div class="sheet-hide-section">
            <textarea class="sheet-multiline-input sheet-input-border" name="attr_attr_EPv2-Morph'"${i}"'-Appearance-Details" placeholder="Morph '"${i}"' Appearance/Description"></textarea>
        </div>
        <br>
        <div class="sheet-boldCenter sheet-topBorderGray" style="padding-top:3px">Morph '"${i}"' Aptitude and Pool Bonuses</div>
        <div class="sheet-table sheet-input-border">
            <div class="sheet-table-row sheet-cell-boldRight">
                <div class="sheet-table-cell sheet-cell-5" title="Cognition - morph total bonus">COG:</div>
                <div class="sheet-table-cell sheet-cell-3 sheet-input-disabled" title="Cognition">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-CogBonusTotal" value="[[@{EPv2-Morph'"${i}"'-CogBonusBase}+@{EPv2-Morph'"${i}"'-CogBonusMisc}]]" disabled /> </div>
                <div class="sheet-table-cell sheet-cell-5" title="Intuition - morph total bonus">INT:</div>
                <div class="sheet-table-cell sheet-cell-3 sheet-input-disabled" title="Intuition">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-IntBonusTotal" value="[[@{EPv2-Morph'"${i}"'-IntBonusBase}+@{EPv2-Morph'"${i}"'-IntBonusMisc}]]" disabled /></div>
                <div class="sheet-table-cell sheet-cell-5" title="Reflexes - morph total bonus">REF:</div>
                <div class="sheet-table-cell sheet-cell-3 sheet-input-disabled" title="Reflexes">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-RefBonusTotal" value="[[@{EPv2-Morph'"${i}"'-RefBonusBase}+@{EPv2-Morph'"${i}"'-RefBonusMisc}]]" disabled /></div>
                <div class="sheet-table-cell sheet-cell-5" title="Savvy - morph total bonus">SAV:</div>
                <div class="sheet-table-cell sheet-cell-3 sheet-input-disabled" title="Savvy">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-SavBonusTotal" value="[[@{EPv2-Morph'"${i}"'-SavBonusBase}+@{EPv2-Morph'"${i}"'-SavBonusMisc}]]" disabled /></div>
                <div class="sheet-table-cell sheet-cell-5" title="Somatics - morph total bonus">SOM:</div>
                <div class="sheet-table-cell sheet-cell-3 sheet-input-disabled" title="Somatics">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-SomBonusTotal" value="[[@{EPv2-Morph'"${i}"'-SomBonusBase}+@{EPv2-Morph'"${i}"'-SomBonusMisc}]]" disabled /></div>
                <div class="sheet-table-cell sheet-cell-5" title="Willpower - morph total bonus">WIL:</div>
                <div class="sheet-table-cell sheet-cell-3 sheet-input-disabled" title="Willpower">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-WilBonusTotal" value="[[@{EPv2-Morph'"${i}"'-WilBonusBase}+@{EPv2-Morph'"${i}"'-WilBonusMisc}]]" disabled /></div>
                <div class="sheet-table-cell sheet-cell-a"></div>

                <div class="sheet-table-cell sheet-cell-7" title="Insight - morph total bonus">Insight:</div>
                <div class="sheet-table-cell sheet-cell-3 sheet-input-disabled" title="Insight">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-InsightBonusTotal" value="[[@{EPv2-Morph'"${i}"'-InsightBonusBase}+@{EPv2-Morph'"${i}"'-InsightBonusMisc}]]" disabled /></div>
                <div class="sheet-table-cell sheet-cell-7" title="Moxie - morph total bonus">Moxie:</div>
                <div class="sheet-table-cell sheet-cell-3 sheet-input-disabled" title="Moxie">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-MoxieBonusTotal" value="[[@{EPv2-Morph'"${i}"'-MoxieBonusBase}+@{EPv2-Morph'"${i}"'-MoxieBonusMisc}]]" disabled /></div>
                <div class="sheet-table-cell sheet-cell-7" title="Vigor - morph total bonus">Vigor:</div>
                <div class="sheet-table-cell sheet-cell-3 sheet-input-disabled" title="Vigor">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-VigorBonusTotal" value="[[@{EPv2-Morph'"${i}"'-VigorBonusBase}+@{EPv2-Morph'"${i}"'-VigorBonusMisc}]]" disabled /></div>
                <div class="sheet-table-cell sheet-cell-7" title="Flex - morph total bonus">Flex:</div>
                <div class="sheet-table-cell sheet-cell-3 sheet-input-disabled" title="Flex">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-FlexBonusTotal" value="[[@{EPv2-Morph'"${i}"'-FlexBonusBase}+@{EPv2-Morph'"${i}"'-FlexBonusMisc}]]" disabled /></div>

                <div class="sheet-table-cell sheet-cell-button" title="Click me to show/hide input cells"><input type="checkbox" class="sheet-checkbox-graygear" name="attr_EPv2-Morph'"${i}"'-Apt-Bonus-Hider" checked /><span/></div>
            </div>
            <input type="checkbox" class="sheet-hider sheet-hider-invis" name="attr_EPv2-Morph'"${i}"'-Apt-Bonus-Hider" checked />
            <div class="sheet-table-row sheet-hide-section" style="text-align:right">
                <div class="sheet-table-cell sheet-cell-5" title="Cognition base Aptitude bonus from Morph">Base:</div>
                <div class="sheet-table-cell sheet-cell-3" title="Cognition base Aptitude bonus from Morph">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-CogBonusBase" value="0" /> </div>
                <div class="sheet-table-cell sheet-cell-5" title="Intuition base Aptitude bonus from Morph">Base:</div>
                <div class="sheet-table-cell sheet-cell-3" title="Intuition base Aptitude bonus from Morph">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-IntBonusBase" value="0" /></div>
                <div class="sheet-table-cell sheet-cell-5" title="Reflexes base Aptitude bonus from Morph">Base:</div>
                <div class="sheet-table-cell sheet-cell-3" title="Reflexes base Aptitude bonus from Morph">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-RefBonusBase" value="0" /></div>
                <div class="sheet-table-cell sheet-cell-5" title="Savvy base Aptitude bonus from Morph">Base:</div>
                <div class="sheet-table-cell sheet-cell-3" title="Savvy base Aptitude bonus from Morph">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-SavBonusBase" value="0" /></div>
                <div class="sheet-table-cell sheet-cell-5" title="Somatics base Aptitude bonus from Morph">Base:</div>
                <div class="sheet-table-cell sheet-cell-3" title="Somatics base Aptitude bonus from Morph">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-SomBonusBase" value="0"/></div>
                <div class="sheet-table-cell sheet-cell-5" title="Willpower base Aptitude bonus from Morph">Base:</div>
                <div class="sheet-table-cell sheet-cell-3" title="Willpower base Aptitude bonus from Morph">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-WilBonusBase" value="0" /></div>
                <div class="sheet-table-cell sheet-cell-a"></div>
                <div class="sheet-table-cell sheet-cell-5" title="Insight pool base bonus from Morph">Base:</div>
                <div class="sheet-table-cell sheet-cell-3" title="Insight pool base bonus from Morph">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-InsightBonusBase" value="0" /></div>
                <div class="sheet-table-cell sheet-cell-5" title="Moxie pool base bonus from Morph">Base:</div>
                <div class="sheet-table-cell sheet-cell-3" title="Moxie pool base bonus from Morph">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-MoxieBonusBase" value="0" /></div>
                <div class="sheet-table-cell sheet-cell-5" title="Vigor pool base bonus from Morph">Base:</div>
                <div class="sheet-table-cell sheet-cell-3" title="Vigor pool base bonus from Morph">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-VigorBonusBase" value="0" /></div>
                <div class="sheet-table-cell sheet-cell-5" title="Flex pool base bonus from Morph">Base:</div>
                <div class="sheet-table-cell sheet-cell-3" title="Flex pool base bonus from Morph">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-FlexBonusBase" value="0" /></div>
                <div class="sheet-table-cell sheet-cell-button"></div>
            </div>
            <div class="sheet-table-row sheet-hide-section" style="text-align:right">
                <div class="sheet-table-cell sheet-cell-5" title="Cognition misc. Aptitude bonus from Morph">Misc:</div>
                <div class="sheet-table-cell sheet-cell-3" title="Cognition misc. Aptitude bonus from Morph">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-CogBonusMisc" value="0" /> </div>
                <div class="sheet-table-cell sheet-cell-5" title="Intuition misc. Aptitude bonus from Morph">Misc:</div>
                <div class="sheet-table-cell sheet-cell-3" title="Intuition misc. Aptitude bonus from Morph">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-IntBonusMisc" value="0" /></div>
                <div class="sheet-table-cell sheet-cell-5" title="Reflexes misc. Aptitude bonus from Morph">Misc:</div>
                <div class="sheet-table-cell sheet-cell-3" title="Reflexes misc. Aptitude bonus from Morph">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-RefBonusMisc" value="0" /></div>
                <div class="sheet-table-cell sheet-cell-5" title="Savvy misc. Aptitude bonus from Morph">Misc:</div>
                <div class="sheet-table-cell sheet-cell-3" title="Savvy misc. Aptitude bonus from Morph">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-SavBonusMisc" value="0" /></div>
                <div class="sheet-table-cell sheet-cell-5" title="Somatics misc. Aptitude bonus from Morph">Misc:</div>
                <div class="sheet-table-cell sheet-cell-3" title="Somatics misc. Aptitude bonus from Morph">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-SomBonusMisc" value="0"/></div>
                <div class="sheet-table-cell sheet-cell-5" title="Willpower misc. Aptitude bonus from Morph">Misc:</div>
                <div class="sheet-table-cell sheet-cell-3" title="Willpower misc. Aptitude bonus from Morph">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-WilBonusMisc" value="0" /></div>

                <div class="sheet-table-cell sheet-cell-a"></div>

                <div class="sheet-table-cell sheet-cell-7" title="Insight pool misc. bonus from Morph">Misc:</div>
                <div class="sheet-table-cell sheet-cell-3" title="Insight pool misc. bonus from Morph">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-InsightBonusMisc" value="0" /></div>

                <div class="sheet-table-cell sheet-cell-7" title="Moxie pool misc. bonus from Morph">Misc:</div>
                <div class="sheet-table-cell sheet-cell-3" title="Moxie pool misc. bonus from Morph">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-MoxieBonusMisc" value="0" /></div>

                <div class="sheet-table-cell sheet-cell-7" title="Vigor pool misc. bonus from Morph">Misc:</div>
                <div class="sheet-table-cell sheet-cell-3" title="Vigor pool misc. bonus from Morph">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-VigorBonusMisc" value="0" /></div>

                <div class="sheet-table-cell sheet-cell-7" title="Flex pool misc. bonus from Morph">Misc:</div>
                <div class="sheet-table-cell sheet-cell-3" title="Flex pool misc. bonus from Morph">
                    <input type="number" name="attr_EPv2-Morph'"${i}"'-FlexBonusMisc" value="0" /></div>

                <div class="sheet-table-cell sheet-cell-button"></div>
            </div>
        </div>
        <br>
        <!-- Eclipse Phase v2 Morph '"${i}"' Traits Repeating -->
        <div class="sheet-boldCenter sheet-topBorderGray" style="padding-top:3px">Morph '"${i}"' Pos & Neg Traits / Advantages/Disadvantages</div>
        <fieldset class="repeating_Morph'"${i}"'-Traits">
            <div class="sheet-table">
                <div class="sheet-table-row sheet-input-border">
                    <div class="sheet-table-cell sheet-cell-button"><button type="roll"></button></div>
                    <div class="sheet-table-cell sheet-cell-5 sheet-span-settings-label">Trait:</div>
                    <div class="sheet-table-cell sheet-cell-a"><input type="text" class="sheet-boldCenter" name="attr_EPv2-Morph'"${i}"'-Trait-Name-Repeating" placeholder="Morph '"${i}"' Trait" /></div>
                    <div class="sheet-table-cell sheet-cell-button"><input type="checkbox" class="sheet-checkbox-graygear" name="attr_EPv2-Morph'"${i}"'-Trait-Details-Hider" checked /><span/></div>
                </div>
            </div>
            <div>
                <input type="checkbox" class="sheet-hider sheet-hider-invis" name="attr_EPv2-Morph'"${i}"'-Trait-Details-Hider" checked />
                <div class="sheet-hide-section">
                    <textarea class="sheet-multiline-input" name="attr_EPv2-Morph'"${i}"'-Trait-Details" placeholder="Morph '"${i}"' Trait Details"></textarea>
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
                    <div class="sheet-table-cell sheet-cell-a"><input type="text" class="sheet-boldCenter" name="attr_EPv2-Morph'"${i}"'-Enhancement-Name-Repeating" placeholder="Morph '"${i}"' Enhancement" /></div>
                    <div class="sheet-table-cell sheet-cell-button"><input type="checkbox" class="sheet-checkbox-graygear" name="attr_EPv2-Morph'"${i}"'-Enhancement-Details-Hider" checked /><span/></div>
                </div>
            </div>
            <div>
                <input type="checkbox" class="sheet-hider sheet-hider-invis" name="attr_EPv2-Morph'"${i}"'-Enhancement-Details-Hider" checked />
                <div class="sheet-hide-section">
                    <textarea class="sheet-multiline-input" name="attr_EPv2-Morph'"${i}"'-Enhancement-Details" placeholder="Morph '"${i}"' Enhancement Details"></textarea>
                </div>
            </div>
        </fieldset><!-- End Eclipse Phase v2 Morph '"${i}"' Enhancements Repeating -->
    </div>
'>> morphs.html
done

sed -i '$ d' morphs.html
echo '</div> <!-- End Eclipse Phase v2 Morphs Section -->'>> morphs.html
