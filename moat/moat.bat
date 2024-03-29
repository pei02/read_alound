@echo off
setlocal enabledelayedexpansion

set "ESC_CHAR=["

set "COLOR_RED=%ESC_CHAR%31m"
set "COLOR_GREEN=%ESC_CHAR%32m"
set "COLOR_BLUE=%ESC_CHAR%96m"
set "COLOR_RESET=%ESC_CHAR%0m"

set moat_arr=219 659 333 128 555 789 456 1208

:input_loop
set /p search_num="請輸入腳數 (輸入 ALL 列出全部內容): "

if /i "%search_num%"=="ALL" (
    echo %COLOR_BLUE%需要護城河的腳數: !moat_arr!%COLOR_RESET%
    goto :input_loop
)

set "found=false"
for %%i in (!moat_arr!) do (
    if %%i equ !search_num! (
        set "found=true"
        goto :found
    )
)

:found
if !found!==true (
    echo %COLOR_GREEN%需要護城河. !search_num!%COLOR_RESET%。
) else (
    echo %COLOR_RED%不需要護城河. !search_num!%COLOR_RESET%。
)

pause >nul
cls
goto input_loop

endlocal
