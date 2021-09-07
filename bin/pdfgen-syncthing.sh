#!/usr/bin/env bash

# Used for generating reMarkable metadata for files synced with Syncthing
# - https://github.com/Evidlo/remarkable_syncthing/issues/1#issuecomment-598885680

set -e

if [[ $# != 2 ]]
then
   echo "Expected 2 arguments: INPUT.PDF OUTPUT_DIR"
   exit
fi

uuid="$(uuidgen)"
cp "$1" "$2/${uuid}.pdf"

cat << EOF > "$2/${uuid}.metadata"
{
    "deleted": false,
    "lastModified": "$(date +%s000)",
    "metadatamodified": true,
    "modified": true,
    "parent": "",
    "pinned": false,
    "synced": false,
    "type": "DocumentType",
    "version": 0,
    "visibleName": "$(basename "$1")"
}
EOF

echo "Created $2/${uuid}.pdf"
echo "Created $2/${uuid}.metadata"
