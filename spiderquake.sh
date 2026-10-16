#!/bin/sh

tazpkg get-install gcc
tazpkg get-install make
tazpkg get-install libsdl-dev

# --- Конфигурация ---
QUAKE_DIR="$HOME/quake" # Директория для установки
SDL_QUAKE_URL="https://www.libsdl.org/projects/quake/src/sdlquake-1.0.9.tar.gz"
QUAKE_DATA_URL="https://www.libsdl.org/projects/quake/data/quakesw-1.0.6.tar.gz"

# --- Проверка прав ---
if [ "$(id -u)" -ne 0 ]; then
    echo "Этот скрипт нужно запускать от имени root (или через sudo)."
    exit 1
fi

# --- Создание директории ---
mkdir -p "$QUAKE_DIR"
cd "$QUAKE_DIR" || exit 1

# --- Загрузка данных ---
echo "Загрузка данных Quake (shareware)..."
wget -c "$QUAKE_DATA_URL" -O quakesw.tar.gz

echo "Загрузка движка sdlquake..."
wget -c "$SDL_QUAKE_URL" -O sdlquake.tar.gz

# --- Распаковка ---
echo "Распаковка файлов..."
tar -xzf quakesw.tar.gz
tar -xzf sdlquake.tar.gz

# Перемещение данных в нужную папку
# Оригинальный архив quakesw-1.0.6.tar.gz обычно содержит папку 'id1'
if [ -d "id1" ]; then
    mv id1 "$QUAKE_DIR/"
else
    # Если структура другая, ищем pak0.pak и перемещаем его
    find . -name "pak0.pak" -exec mkdir -p "$QUAKE_DIR/id1" \; -exec mv {} "$QUAKE_DIR/id1/" \;
fi

# --- Сборка движка (при необходимости) ---
# Проверяем, есть ли готовый бинарник. Если нет, пробуем собрать.
# В SliTaz могут потребоваться пакеты разработки: tazpkg get-install gcc make libsdl-dev
if [ ! -f "sdlquake" ]; then
    echo "Готовый бинарник sdlquake не найден. Попытка сборки..."
    # Проверяем наличие компилятора
    if ! command -v gcc >/dev/null 2>&1; then
        echo "Для сборки необходим компилятор gcc. Установите его и запустите скрипт снова."
        exit 1
    fi
    # Пытаемся собрать
    if [ -f "Makefile" ]; then
        make
    fi
fi

echo "--- Установка завершена! ---"
echo "Файлы игры находятся в: $QUAKE_DIR"
echo "Для запуска игры (из директории $QUAKE_DIR) используйте команду:"
echo "./sdlquake -fullscreen"
