#!/bin/sh
defaultAccessKey="lazycat123"
customAccessCodeFile="/lzcapp/var/data/accessCode.txt"
if [ -f "$customAccessCodeFile" ]; then
    echo "custom access code file found.use custom access code"
    export PICLIST_ACCESS_AUTH_CODE=$(cat "$customAccessCodeFile" 2>/dev/null || echo "$defaultAccessKey")
else
    echo "custom access code file not found.use default access code: $defaultAccessKey"
    export PICLIST_ACCESS_AUTH_CODE="$defaultAccessKey"
fi
node /usr/local/bin/picgo-server -k $PICLIST_ACCESS_AUTH_CODE
