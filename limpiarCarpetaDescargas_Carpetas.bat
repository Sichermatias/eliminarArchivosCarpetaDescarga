@echo off
rem cambia la página de códigos de la consola a UTF-8
chcp 65001
setlocal enabledelayedexpansion

rem script para eliminar carpetas de un directorio dado

rem Especifica la ruta completa del directorio
set "directorio=C:\Users\ALUMNO\Downloads"

rem Especifica la ruta completa del archivo .txt con los nombres de las carpetas a guardar
set "whitelist="

cd /d "%directorio%"

for /d %%C in (*) do (
    set "mantener=0"
    for /f "usebackq delims=" %%A in ("%whitelist%") do (
        if "%%~nxC" equ "%%~nxA" (
            set "mantener=1"
        )
    )
    if "!mantener!" equ "0" (
        echo Eliminando carpeta: "%%C"
        rd /s /q "%%C"
    )
)

endlocal
pause