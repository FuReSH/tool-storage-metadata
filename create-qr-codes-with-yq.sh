#!/bin/bash
# change into the script directory
current_dir=$(dirname "${BASH_SOURCE[0]}")
cd $current_dir && pwd
# path to input directory
input_dir="$current_dir/tools"
#  path to output directory
output_dir="./assets"
# base url for our tool repository
baseurl="https://furesh.github.io/tool-storage-metadata/tools"
for fullpath in $input_dir/*; do
    # check for yaml files only
    if [[ "$fullpath" == *\.y*ml ]]
    then
        # read yaml with the yq tool
        name="$(yq '.name' $fullpath)"
        wd_id="$(yq '.wikidata-id' $fullpath)"
        # create and save a QR code
        qr_target=$baseurl/$name.html
        qr_path=$output_dir/qr-codes/$name.jpg
        # echo "Creating and saving QR code for $name ($wd_id)"
        # curl qrcode.show -d $qr_target \
        #     -H "Accept: image/jpeg" \
        #     --output $qr_path
        # update the yaml
        echo "Updating input YAML with path to saved QR code"
        yq -i ".qr-code = \"$qr_path\"" $fullpath
        # query Zotero and save the output
        bib_path="$output_dir/bibliography/$name.bib"
        zot_query="https://api.zotero.org/groups/4598521/items?v=3&key=8Rc9JhCEQvTzX0GSDi5sYIFX&format=bibtex"
        tag="tutorial:%20$name%20||%20topic:%20$name%20||%20uses:%20$name"
        # potentially add further conditions to the query
        zot_query="$zot_query&tag=$tag"
        echo "Query Zotero for references tagged with $name"
        curl "$zot_query" \
            --output $bib_path
        # update the yaml
        echo "Updating input YAML with path to saved bibliography"
        yq -i ".bibliography = \"$bib_path\"" $fullpath
    fi
done