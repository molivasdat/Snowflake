#!/bin/bash

WORKING_FILE="${1}".new
FINAL_LOG="${1}".html

#
# Make a copy
#
cp "${1}" ${WORKING_FILE} 

# #
# # Create header and footer files for final concatenation
# #
# echo "{ \"structuredLog\": [" > header.txt
# echo "] }" > footer.txt

#
# Add commas to each ending '}'
# and then remove the last one
#
cat "${WORKING_FILE}" | sed -e 's/}$/},/' > body.txt
sed -i -e '$ s/.$//' body.txt

#
# Put the files together and pretty print it
#
cat header.txt body.txt footer.txt > "${FINAL_LOG}" 

echo "${FINAL_LOG}"
#jq -r .structuredLog[0] "${FINAL_LOG}"
