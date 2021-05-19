#!/usr/bin/env bash

# env vars
NEWDIR_DEFAULT="$PWD/drafts"
SHA1_NEW_DIR_TOKEN=$(echo -n $(date) | sha1sum | awk '{print $1}')

# command logic
# maybe improve this next time
if echo $@ | grep -qE 'TODO'; then
    echo "You're in noninteractive mode. To abort, press Ctrl+C and rerun"
    echo "the script without the flag. Generating..."
    sleep 5
    if echo $@ | grep -qE "issue"; then
        NEWDIR=$NEWDIR_DEFAULT/regular-issues/$SHA1_NEW_DIR_TOKEN
        mkdir -p $NEWDIR
        cp -r templates/regular-issue/ $NEWDIR/
    fi
else
    echo wat
fi

if [[ $1 == "" ]]; then
    echo "Usage: $0 [template] [--nointeractive|overwrite]"
    echo "One script to create a new issue/article for Recap Time faster."
    echo
    echo "Supported params:"
    echo "  template           Optional template name, can be either"
    echo "                     issue, community-posts, or updates-radio"
    echo
    echo "Supported flags:"
    echo "  --nointeractive
    exit
fi
