@echo off
setlocal enabledelayedexpansion

set "ESC_CHAR=["

set "COLOR_RED=%ESC_CHAR%31m"
set "COLOR_GREEN=%ESC_CHAR%32m"
set "COLOR_BLUE=%ESC_CHAR%96m"
set "COLOR_RESET=%ESC_CHAR%0m"

set arr=219 659 333 128 555 789 456 1208

:input_loop
set /p search_num="½Ð¿é¤J¸}¼Æ (¿é¤J ALL ¦C¥X¥þ³¡¤º®e): "

if /i "%search_num%"=="ALL" (
    echo %COLOR_BLUE%»Ý­nÅ@«°ªeªº¸}¼Æ: !arr!%COLOR_RESET%
    goto :input_loop
)

set "found=false"
for %%i in (%arr%) do (
    if %%i equ !search_num! (
        set "found=true"
        goto :found
    )
)

:found
if !found!==true (
    echo %COLOR_GREEN%»Ý­nÅ@«°ªe. !search_num!%COLOR_RESET%¡C
) else (
    echo %COLOR_RED%¤£»Ý­nÅ@«°ªe. !search_num!%COLOR_RESET%¡C
)

pause >nul
cls
goto input_loop

endlocal
