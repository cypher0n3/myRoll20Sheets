#!/usr/bin/env bash

set -e

if [[ -f script_workers.html ]]; then
    rm -f script_workers.html
fi

echo '<!-- Eclipse Phase v2 Script Workers -->
<script type="text/worker">
    on("ready change:EPv2CurrentSelectedMorph change:EPv2Morph1Name change:EPv2Morph2Name change:EPv2Morph3Name change:EPv2Morph4Name change:EPv2Morph5Name change:EPv2Morph1Dur change:EPv2Morph2Dur change:EPv2Morph3Dur change:EPv2Morph4Dur change:EPv2Morph5Dur",
        function(){
            const morphProps = [
                "EPv2CurrentSelectedMorph", "EPv2MorphsCurrentMorphName",
                "EPv2Morph1Name", "EPv2Morph2Name", "EPv2Morph3Name", "EPv2Morph4Name", "EPv2Morph5Name",
                "EPv2DUR", "EPv2Morph1Dur", "EPv2Morph2Dur", "EPv2Morph3Dur","EPv2Morph4Dur", "EPv2Morph5Dur"
            ]
            getAttrs(morphProps, function(values){
                if (values.EPv2CurrentSelectedMorph == 1){
                    setAttrs({
                        EPv2MorphsCurrentMorphName: values.EPv2Morph1Name,
                        EPv2DUR: values.EPv2Morph1Dur
                    });
                } else if (values.EPv2CurrentSelectedMorph == 2){
                    setAttrs({
                        EPv2MorphsCurrentMorphName: values.EPv2Morph2Name,
                        EPv2DUR: values.EPv2Morph2Dur
                    });
                } else if (values.EPv2CurrentSelectedMorph == 3){
                    setAttrs({
                        EPv2MorphsCurrentMorphName: values.EPv2Morph3Name,
                        EPv2DUR: values.EPv2Morph3Dur
                    });
                } else if (values.EPv2CurrentSelectedMorph == 4){
                    setAttrs({
                        EPv2MorphsCurrentMorphName: values.EPv2Morph4Name,
                        EPv2DUR: values.EPv2Morph4Dur
                    });
                } else if (values.EPv2CurrentSelectedMorph == 5){
                    setAttrs({
                        EPv2MorphsCurrentMorphName: values.EPv2Morph5Name,
                        EPv2DUR: values.EPv2Morph5Dur
                    });
                }
            });
        }
    );
</script>
<!-- END Eclipse Phase v2 Script Workers -->' > script_workers.html
