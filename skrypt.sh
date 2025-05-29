#!/bin/bash
function show_help {
  echo "--date, -d  Wyświetla dzisiejszą datę"
  echo "--logs [N], -1 [N]  Tworzy N (domyślnie 100) plików logx.txt"
  echoo "--help, -h  Wyświetla wszystkie polecenia"
}

case "$1" in
  --date|-d)
    date
    ;;

  --logs)
  if [[ "$2" =~ ^[0-9]+$]]; then
    count = $2
  else
    count = 100
  fi

  for i in $(seq 1 $count ); do
    FILENAME = "log${i}.txt"
    echo "plik: $FILENAME" > "$FILENAME"
    echo "Skrypt: $0" >> "$FILENAME"
    echo "Data: $(date)" >> "$FILENAME"
  done
  ;;

    *)
        echo "Błędna flaga. Użyj --help"
        ;;
esac