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
        # remove the path
        filename="${fullpath##*/}"
        # get the filename without the extension
        base=${filename%%.*}
        echo "generating QR code for new tool: $base"
        curl qrcode.show -d $baseurl/$base.html \
            -H "Accept: image/jpeg" \
            --output $output_dir/$base.jpg
    fi
done
