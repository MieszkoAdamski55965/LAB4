#!/bin/bash
function show_help {
  echo "--date, -d  Wyświetla dzisiejszą datę"
  echo "--logs [N], -1 [N]  Tworzy N (domyślnie 100) plików logx.txt"
  echo "--help, -h  Wyświetla wszystkie polecenia"
  echo "--init Klonuje repozytorium"
  echo "--error [N], -e [N]  Tworzy N (domyślnie 100) katalogów errorx/errorx.txt"
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


  --init)
    echo "Klonuję repozytorium..."
    REPO_URL="https://github.com/MieszkoAdamski55965/LAB4.git"
    TARGET_DIR="LAB4_CLONE"
    git clone "$REPO_URL" "$TARGET_DIR"

    if [[ $? -eq 0 ]]; then
      echo "Dodaję $TARGET_DIR do PATH"
      export PATH="$PATH:$(pwd)/$TARGET_DIR"
      echo 'export PATH="$PATH:'"$(pwd)/$TARGET_DIR"'"' >> ~/.bashrc
      echo "Zmienna PATH zaktualizowana."
      
    else
      echo "Błąd: nie udało się sklonować repozytorium."
    fi
    ;;

  --error|-e)
    if [[ "$2" =~ ^[0-9]+$ ]]; then
      ERR_COUNT=$2
    else
      ERR_COUNT=100
    fi

    for i in $(seq 1 $ERR_COUNT); do
      DIRNAME="error${i}"
      mkdir -p "$DIRNAME"
      echo "Plik błędu nr $i" > "${DIRNAME}/error${i}.txt"
    done
    ;;
 
  *)
        echo "Błędna flaga. Użyj --help lub -h"
        ;;
esac
