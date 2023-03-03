# check if tool and blackbox directories exist
DIR_TOOLS="tools"
DIR_BLACKBOXES="blackboxes"
# if exist, validate all yaml files in the directories
if [ -d "$DIR_TOOLS" ] && [ ! -z "$(ls -A $DIR_TOOLS)" ]
then
    check-jsonschema -v --schemafile schemas/tool.schema.json $DIR_TOOLS/*
else
    echo "Warning: '$DIR_TOOLS' NOT found."
fi
if [ -d "$DIR_BLACKBOXES" ] && [ ! -z "$(ls -A $DIR_BLACKBOXES)" ]
then
    check-jsonschema -v --schemafile schemas/blackbox.schema.json $DIR_BLACKBOXES/*
else
    echo "Warning: '$DIR_BLACKBOXES' NOT found."
fi
