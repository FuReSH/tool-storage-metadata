# check if tool and blackbox directories exist
#!/bin/bash
# change into the script directory
current_dir=$(dirname "${BASH_SOURCE[0]}")
cd $current_dir && pwd
# path to input directory
DIR_TOOLS="$current_dir/tmp/tools"
DIR_BLACKBOXES="$current_dir/tmp/blackboxes"
# if exist, validate all yaml files in the directories
if [ -d $DIR_TOOLS ] && [ -e $DIR_TOOLS/*\.y*ml ]
then
    check-jsonschema -v --schemafile schemas/tool.schema.json $DIR_TOOLS/*
else
    echo "Warning: '$DIR_TOOLS' data NOT found."
fi
if [ -d "$DIR_BLACKBOXES" ] && [ -e $DIR_TOOLS/*\.y*ml ] #[ ! -z "$(ls -A $DIR_BLACKBOXES)" ]
then
    check-jsonschema -v --schemafile schemas/blackbox.schema.json $DIR_BLACKBOXES/*
else
    echo "Warning: '$DIR_BLACKBOXES' data NOT found."
fi
