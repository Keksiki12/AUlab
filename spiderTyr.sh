#!/bin/sh
# Скрипт установки TyrQuake в SliTaz GNU/Linux
# Запускать от имени root: sh install_tyrquake.sh

set -e # Останавливаем скрипт при любой ошибке

echo "=== 1. Установка инструментов сборки ==="
# SliTaz использует tazpkg. Устанавливаем компилятор, make, wget и SDL 1.2
tazpkg recharge
tazpkg get-install slitaz-toolchain  # Мета-пакет с gcc, make, binutils
tazpkg get-install wget
tazpkg get-install SDL-dev            # Библиотеки разработки для SDL 1.2

echo "=== 2. Скачивание исходников TyrQuake ==="
cd /tmp
wget -c https://disenchant.net/tyrquake/files/tyrquake-0.62.tar.gz

echo "=== 3. Распаковка ==="
tar -xzf tyrquake-0.62.tar.gz
cd tyrquake-0.62

echo "=== 4. Сборка и установка ==="
# TyrQuake использует простую систему сборки на make.
# Собираем все клиенты (включая tyr-glquake и tyr-sdlquake)
make
make install

echo "=== Готово! ==="
echo "Исполняемые файлы установлены в /usr/local/bin/"
echo "Проверьте: ls /usr/local/bin/tyr-*"
