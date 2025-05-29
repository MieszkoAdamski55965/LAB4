#!/bin/bash
function show_help {
  echo "--date, -d  Wyświetla dzisiejszą datę"
  echo "--logs [N], -1 [N]  Tworzy N (domyślnie 100) plików logx.txt"
  echo "--help, -h  Wyświetla wszystkie polecenia"
}

case "$1" in
  --date|-d)
    date
    ;;

  --logs|-1)
    if [[ "$2" =~ ^[0-9]+$ ]]; then
      COUNT=$2
    else
      COUNT=100
    fi

    for i in $(seq 1 $COUNT ); do
      FILENAME="log${i}.txt"
      echo "Plik: $FILENAME" > "$FILENAME"
      echo "Skrypt: $0" >> "$FILENAME"
      echo "Data: $(date)" >> "$FILENAME"
    done
    ;;
  --help|-h)
    show_help
    ;;

  *)
        echo "Błędna flaga. Użyj --help lub -h"
        ;;
esac
