#!/bin/bash

output="$(swaymsg -t get_tree | jq -r 'recurse(.nodes[]?)|recurse(.floating_nodes[]?)|select(.name == "__i3_scratch").floating_nodes[]|"`<b>"+.name+"`</b> - "+.app_id+" "+(.id|tostring)')"
number="$(swaymsg -r -t get_tree | jq -r 'recurse(.nodes[]) | first(select(.name=="__i3_scratch")) | .floating_nodes | length')"

if [ "$number" -gt 0 ]; then
    text="缾 $number"
else
    text=""
fi

output="$(echo "$output" | sed -r 's/[&]+/and/g')" # Replace unprintable & character with the word 'and'
tooltip="缾 Scratchpad\n\n"
tooltip+="$(echo "$output" | sed -z 's/\n/\\n/g')"
tooltip=${tooltip::-2}

echo "{\"text\":\"$text\", \"tooltip\":\"$tooltip\"}"
exit 0
