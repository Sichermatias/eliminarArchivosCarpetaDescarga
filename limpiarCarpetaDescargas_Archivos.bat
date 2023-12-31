@echo off
rem cambia la p�gina de c�digos de la consola a UTF-8
chcp 65001 
setlocal enabledelayedexpansion

rem script para eliminar archivos de un directorio dado


rem Especifica la ruta completa del directorio
set "directorio=C:\Users\ALUMNO\Downloads"
rem Especifica la ruta completa del archivo .txt con los nombres de las carpetas a guardar
set "whitelist="

cd /d "%directorio%"

for %%F in (*) do (
    set "mantener=0"
    for /f "usebackq delims=" %%A in ("%whitelist%") do (
        if "%%~nxF" equ "%%~nxA" (
            set "mantener=1"
        )
    )
    if "!mantener!" equ "0" (
        echo Eliminando archivo: "%%F"
        del "%%F"
    )
)

endlocal
rem pause