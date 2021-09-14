#!/bin/sh -l

set -e  # if a command fails it stops the execution
set -u  # script fails if trying to access to an undefined variable

for file in $FILES; do
  filename="$(basename -- $file)"

  curl -X POST https://content.dropboxapi.com/2/files/upload \
      --header "Authorization: Bearer $ACCESS_TOKEN" \
      --header "Dropbox-API-Arg: {\"path\": \"$DESTINATION/$filename\"}" \
      --header "Content-Type: application/octet-stream" \
      --data-binary @$file
done;