#!/bin/bash
# change into the script directory
current_dir=$(dirname "${BASH_SOURCE[0]}")
cd $current_dir && pwd
# path to input directory
input_dir="$current_dir/tools"
#  path to output directory
output_dir="./assets/qr-codes"
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
        qr_path=$output_dir/$name.jpg
        echo "Creating and saving QR code for $name ($wd_id)"
        curl qrcode.show -d $qr_target \
            -H "Accept: image/jpeg" \
            --output $qr_path
        # update the yaml
        echo "Updating input YAML with path to saved QR code"
        yq -i ".qr-code = \"$qr_path\"" $fullpath
        # query Zotero and save the output
        # update the yaml
    fi
done