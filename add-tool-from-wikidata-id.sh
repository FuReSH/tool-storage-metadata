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
# check if the input is a QId

# empty variable for result of check
exists=FALSE
# read all yaml files in the input directory and check if one contains the Wikidata ID
for fullpath in $input_dir/*\.y*ml; do
    # only read files if the Wikidata ID has not yet been found
    if [[ $exists == FALSE ]]; then
        # read yaml with the yq tool
        wd_id="$(yq '.wikidata-id' $fullpath)"
        # if the QID is already present in our directory, switch the value of $exists to TRUE
        if [[ $wd_id == $input ]]; then
            exists=TRUE
        fi
    fi
done

# if the QID is not present, create a new file
if [[ $exists == FALSE ]]; then
    echo "we will create a new file for $input"
    # query wikidata for label
    label=$(curl -X "GET" \
        "https://www.wikidata.org/w/rest.php/wikibase/v0/entities/items/$input/labels" \
        -H "accept: application/json")
    # create a name from the label
    # read a specific label
    name=$(yq '.en' <<< $label)
    # make the label conformant with our naming scheme
    name=$(echo "$name" | perl -pe 's/\W+(\w)/-$1/g and s/([A-Z])/\L$1/g')
    # create a new, empty yml file
    yml_path="$output_dir/$name.tool.yml"
    > $yml_path
    # write content to this file
    yq -i ".name = \"$name\"" $yml_path
    yq -i ".wikidata-id = \"$input\"" $yml_path
else
    echo "$input already exists in our registry"
fi