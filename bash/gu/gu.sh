#!/bin/bash
if [[ "$1" =~ ^[a-zA-Z0-9_.-]*$ ]] 
then
  low="$(echo $1 | tr '[:upper:]' '[:lower:]')"
  upp="$(echo $1 | tr '[:lower:]' '[:upper:]')"
  pat="\(.*/"
  for ((x=0; x<${#low}; x++));
  do
    pat+="[${low:x:1}${upp:x:1}]"
  done
  pat+="[^/]*/\)"
  dir=$(expr match "$(pwd)" $pat)
  cd "$dir"
else 
  echo "Bad argument " $1
fi
