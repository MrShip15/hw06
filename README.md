[![Build Status](https://travis-ci.org/MrShip15/hw04.svg?branch=master)](https://travis-ci.org/MrShip15/hw04)
[![Build status](https://ci.appveyor.com/api/projects/status/wkbl6ku2g573k1v4?svg=true)](https://ci.appveyor.com/project/MrShip15/hw04)


## Homework IV

Вы продолжаете проходить стажировку в "Formatter Inc." (см [подробности](https://github.com/tp-labs/lab03#Homework)).

В прошлый раз ваше задание заключалось в настройке автоматизированной системы **CMake**.

Сейчас вам требуется настроить систему непрерывной интеграции для библиотек и приложений, с которыми вы работали в [прошлый раз](https://github.com/tp-labs/lab03#Homework). Настройте сборочные процедуры на различных платформах:
* используйте [TravisCI](https://travis-ci.com/) для сборки на операционной системе **MacOS** с использованием компиляторов **gcc** и **clang**;
* используйте [AppVeyour](https://www.appveyor.com/) для сборки на операционной системе **Windows**.

Настройка git-репозитория **hw04** для работы
```sh
% git clone https://github.com/MrShip15/hw03 projects/hw04
% cd projects/hw04
% git remote remove origin
% git remote add origin https://github.com/MrShip15/hw04
```
Cоздание единого `CMakeLists.txt`, по которому будет осуществляться сборка при помощи **TravisCI**
```sh
% cat >> CMakeLists.txt <<EOF
cmake_minimum_required(VERSION 3.10)
project(formatter)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_library(formatter STATIC formatter_lib/formatter.cpp)
include_directories(formatter_lib)

add_library(formatter_ex STATIC formatter_ex_lib/formatter_ex.cpp)
include_directories(formatter_ex_lib)

add_executable(hello_world hello_world_application/hello_world.cpp)
target_link_libraries(hello_world formatter formatter_ex)

add_library(solver_lib STATIC solver_lib/solver.cpp)
include_directories(solver_lib)

add_executable(solver solver_application/equation.cpp)
target_link_libraries(solver formatter formatter_ex solver_lib)
EOF
```
Создание файла `.travis.yml`
```sh
# Установка языка программирования
# операционной системы и компиляторов
% cat > .travis.yml <<EOF
language: cpp
os:
  - osx
EOF
```
Скрипт, который выполняет команды `cmake` для сборки проектов в каждой директории
```sh
% cat >> script <<EOF
cmake formatter_lib/CMakeLists.txt -Bformatter_lib/_build -DCMAKE_CURRENT_SOURCE_DIR=$PWD
cmake --build formatter_lib/_build
cmake formatter_ex_lib/CMakeLists.txt -Bformatter_ex_lib/_build -DCMAKE_CURRENT_SOURCE_DIR=$PWD
cmake --build formatter_ex_lib/_build
cmake hello_world_application/CMakeLists.txt -Bhello_world_application/_build -DCMAKE_CURRENT_SOURCE_DIR=$PWD
cmake --build hello_world_application/_build
cmake solver_application/CMakeLists.txt -Bsolver_application/_build -DCMAKE_CURRENT_SOURCE_DIR=$PWD
cmake --build solver_application/_build
EOF
```
Установка пользовательского сценария запуска с помощью **CMake**
```sh
# Установка настроек СMake, запуск и исполнение
% cat >> .travis.yml <<EOF
jobs:
  include:
  - name: "all projects"
    script:
    - cmake -H. -B_build
    - cmake --build _build
  - name: "each CMakeLists.txt"
    script:
    - source ./script
EOF
```
Установка дополнительных исполняемых файлов и пакетов
```sh
# Дополнения конфигурирации источников и пакетов
% cat >> .travis.yml <<EOF
addons:
  apt:
    sources:
      - george-edison55-precise-backports
    packages:
      - cmake
      - cmake-data
EOF


```
Проверка `.travis.yml` на ошибки
```sh
% travis lint
Hooray, .travis.yml looks valid :)
```
Создание файла `appveyor.yml`
```sh
% cat >> .appveyor.yml <<EOF
image: Visual Studio 2019
EOF
% cat >> .appveyor.yml <<EOF
build_script:
    - cmd: cmake -H. -B_build
    - cmd: cmake --build _build
EOF
```
Вставка значков с Build Status для `travis-ci.org` и `appveyor.com`
```sh
% ex -sc '1i|[![Build Status](https://travis-ci.org/MrShip15/hw04.svg?branch=master)](https://travis-ci.org/MrShip15/hw04)' -cx README.md
% ex -sc '2i|[![Build status](https://ci.appveyor.com/api/projects/status/wkbl6ku2g573k1v4?svg=true)](https://ci.appveyor.com/project/MrShip15/hw04)' -cx README.md
```
## Links

- [Travis Client](https://github.com/travis-ci/travis.rb)
- [AppVeyour](https://www.appveyor.com/)
- [GitLab CI](https://about.gitlab.com/gitlab-ci/)

```
Copyright (c) 2015-2020 The ISC Authors
```
