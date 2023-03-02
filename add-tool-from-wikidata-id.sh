#!/bin/bash
# change into the script directory
current_dir=$(dirname "${BASH_SOURCE[0]}")
cd $current_dir && pwd
# path to input directory
input_dir="$current_dir/tools"
#  path to output directory
output_dir=$input_dir
# ask for input
read -p "Please provide a valid Wikidata ID: " input
# check if the input contains a QId
if [[ $input =~ (Q[0-9]+) ]]; then
    # extract die Wikidata ID from the input
    wd_id_input=$(echo "$input" | perl -pe 's/^.*(Q\d+).*$/$1/g')
    echo "Input contains the Wikidata ID $wd_id_input"
    # read all yaml files in the input directory and check if one contains the Wikidata ID
    # dummy variable for result of check
    exists=FALSE
    for fullpath in $input_dir/*\.y*ml; do
        # only read files if the Wikidata ID has not yet been found
        if [[ $exists == FALSE ]]; then
            # read yaml with the yq tool
            wd_id="$(yq '.wikidata-id' $fullpath)"
            # if the QID is already present in our directory, switch the value of $exists to TRUE
            if [[ $wd_id == $wd_id_input ]]; then
                exists=TRUE
            fi
        fi
    done

    # if the QID is not present, create a new file
    if [[ $exists == FALSE ]]; then
        echo "we will create a new file for $wd_id_input"
        # query wikidata for label
        label=$(curl -X "GET" \
            "https://www.wikidata.org/w/rest.php/wikibase/v0/entities/items/$wd_id_input/labels" \
            -H "accept: application/json" \
            --silent)
        # create a name from the label
        # read a specific label: English
        name=$(yq '.en' <<< $label)
        # make the label conformant with our naming scheme
        name=$(echo "$name" | perl -pe 's/\W+(\w)/-$1/g')
        name=$(echo "$name" | perl -pe 's/([A-Z])/\L$1/g')
        # create a new, empty yml file
        yml_path="$output_dir/$name.tool.yml"
        > $yml_path
        # write content to this file
        yq -i ".name = \"$name\"" $yml_path
        yq -i ".wikidata-id = \"$wd_id_input\"" $yml_path
    else
        echo "$wd_id_input already exists in our registry"
    fi
else
    echo "Input does not contain a Wikidata ID"
fi