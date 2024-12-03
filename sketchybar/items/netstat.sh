#!/bin/bash

# Функция для форматирования байтов
formatBytes() {
  local bytes=$1
  if [ "$bytes" -eq 0 ]; then
    echo "0b"
    return
  fi

  local k=1024
  local sizes=("b" "kb" "mb" "gb" "tb" "pb" "eb" "zb" "yb")
  local i=0

  while [ "$bytes" -ge "$k" ] && [ $i -lt ${#sizes[@]} ]; do
    bytes=$((bytes / k))
    ((i++))
  done

  echo "${bytes}${sizes[i]}"
}

# Получение данных сетевого трафика (пример через ifstat)
DOWNLOAD=$(ifstat -i en0 0.1 1 | awk 'NR==3 {print $1*1024}')
UPLOAD=$(ifstat -i en0 0.1 1 | awk 'NR==3 {print $2*1024}')

# Форматируем
DOWNLOAD_FORMATTED=$(formatBytes "$DOWNLOAD")
UPLOAD_FORMATTED=$(formatBytes "$UPLOAD")

# Отправляем данные в sketchybar
sketchybar --set netstat_down label="$DOWNLOAD_FORMATTED"
sketchybar --set netstat_up label="$UPLOAD_FORMATTED"
