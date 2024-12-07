#!/bin/bash

# Получение списка интерфейсов (исключаем lo)
INTERFACES=$(ifconfig -l | tr ' ' '\n' | grep -v '^lo')

# Инициализация сумм для входящего и исходящего трафика
TOTAL_DOWN=0
TOTAL_UP=0

# Цикл по каждому интерфейсу
for INTERFACE in $INTERFACES; do
    # Получение скорости трафика для текущего интерфейса
    UPDOWN=$(ifstat -i "$INTERFACE" 0.1 1 2>/dev/null | tail -n 1)

    # Разделение входящих и исходящих данных
    DOWN=$(echo "$UPDOWN" | awk '{ print $1 }' | cut -d "." -f 1)
    UP=$(echo "$UPDOWN" | awk '{ print $2 }' | cut -d "." -f 1)

    # Проверка, что DOWN и UP корректные числа
    if [[ "$DOWN" =~ ^[0-9]+$ ]] && [[ "$UP" =~ ^[0-9]+$ ]]; then
        TOTAL_DOWN=$((TOTAL_DOWN + DOWN))
        TOTAL_UP=$((TOTAL_UP + UP))
    fi
done

# Форматирование входящих данных
if [ "$TOTAL_DOWN" -gt 999 ]; then
    DOWN_FORMAT=$(echo "$TOTAL_DOWN" | awk '{ printf "%.0f MBps", $1 / 1000 }')
else
    DOWN_FORMAT=$(echo "$TOTAL_DOWN" | awk '{ printf "%.0f KBps", $1 }')
fi

# Форматирование исходящих данных
if [ "$TOTAL_UP" -gt 999 ]; then
    UP_FORMAT=$(echo "$TOTAL_UP" | awk '{ printf "%.0f MBps", $1 / 1000 }')
else
    UP_FORMAT=$(echo "$TOTAL_UP" | awk '{ printf "%.0f KBps", $1 }')
fi

# Передача данных в SketchyBar
sketchybar --set network label="⬇ $DOWN_FORMAT  ⬆ $UP_FORMAT"
