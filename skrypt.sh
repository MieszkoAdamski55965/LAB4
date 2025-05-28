#!/bin/bash

case "$1" in
  --date|-d)
    date
    ;;


    *)
        echo "Błędna flaga. Użyj --help"
        ;;
esac