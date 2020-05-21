#!/bin/bash

KEY=$1
URL=$2
dir="./export"

dashboards=$(curl -sS -k -H "Authorization: Bearer $KEY" $URL/api/search\?query\=\& | jq '.[] | .uri' | sed 's/"//g' | cut -d '/' -f2)

for i in $dashboards
do
        curl -sS -k -H "Authorization: Bearer $KEY" $URL/api/dashboards/db/$i > $dir/$i.json
done