include(InstallRequiredSystemLibraries)

# Установка контакта
set(CPACK_PACKAGE_CONTACT evgengrmit@icloud.com)
# Установка версии пакета
set(CPACK_PACKAGE_VERSION_MAJOR ${SOLVER_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${SOLVER_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${SOLVER_VERSION_PATCH})
set(CPACK_PACKAGE_VERSION ${SOLVER_VERSION})
#  Установка с файлом описания проекта
set(CPACK_PACKAGE_DESCRIPTION_FILE ${CMAKE_CURRENT_SOURCE_DIR}/DESCRIPTION)
# Краткое описание проекта
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Application Solver for square equation")

# Установка лицензии
set(CPACK_RESOURCE_FILE_LICENSE ${CMAKE_CURRENT_SOURCE_DIR}/LICENSE)
# Добавление README.md
set(CPACK_RESOURCE_FILE_README ${CMAKE_CURRENT_SOURCE_DIR}/README.md)

# Имя пакета RPM
set(CPACK_RPM_PACKAGE_NAME "solver-devel")
# Лицензионная политика пакета RPM.
set(CPACK_RPM_PACKAGE_LICENSE "MIT")
# Группа пакетов RPM
set(CPACK_RPM_PACKAGE_GROUP "solver")
# Добавление файла с описанием изменений пакета
set(CPACK_RPM_CHANGELOG_FILE ${CMAKE_CURRENT_SOURCE_DIR}/ChangeLog.md)
# Выпуск пакета RPM
set(CPACK_RPM_PACKAGE_RELEASE 1)

# Имя пакета DEBIAN
set(CPACK_DEBIAN_PACKAGE_NAME "AppSolver")
# Условия для работы пакета
set(CPACK_DEBIAN_PACKAGE_PREDEPENDS "cmake >= 3.0")
# Выпуск пакета DEBIAN
set(CPACK_DEBIAN_PACKAGE_RELEASE 1)

# Имя созданного пакета
set(CPACK_DMG_VOLUME_NAME "solverOS")
# Минимальная версия OSX
set(CPACK_OSX_PACKAGE_VERSION 10.5)
set(CPACK_WIX_LICENSE_RTF /LICENSE.txt)

# Помощь в установке пакета
set(CPACK_NSIS_HELP_LINK https://github.com/MrShip15/hw06)
# Помощь в использовании
set(CPACK_NSIS_URL_INFO_ABOUT https://github.com/MrShip15/hw06)
# Контактная информация
set(CPACK_NSIS_CONTACT mr_ship2001@mail.ru)

include(CPack)
