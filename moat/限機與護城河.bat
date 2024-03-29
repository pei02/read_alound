@echo off
setlocal enabledelayedexpansion

set "ESC_CHAR=["

set "COLOR_RED=%ESC_CHAR%31m"
set "COLOR_GREEN=%ESC_CHAR%32m"
set "COLOR_BLUE=%ESC_CHAR%96m"
set "COLOR_PURPLE=%ESC_CHAR%95m"
set "COLOR_YELLOW=%ESC_CHAR%93m"
set "COLOR_RESET=%ESC_CHAR%0m"

set moat_arr=219 659 333 128 555 789 456 1208
set Prohibit_arr=1208 1643 1310 486 455

:input_loop
set /p search_num="請輸入腳數 (輸入 ALL 列出全部內容): "

if /i "%search_num%"=="ALL" (
    echo %COLOR_BLUE%需要護城河的腳數: !moat_arr!%COLOR_RESET%
    echo %COLOR_YELLOW%限新機作業腳數: !Prohibit_arr!%COLOR_RESET%
    goto :input_loop
)

set "moat_found=false"
set "Prohibit_found=false"

for %%i in (!moat_arr!) do (
    if %%i equ !search_num! (
        set "moat_found=true"
        goto :check_prohibit
    )
)

:check_prohibit
for %%i in (!Prohibit_arr!) do (
    if %%i equ !search_num! (
        set "Prohibit_found=true"
        goto :found
    )
)

:found
if !moat_found!==true (
    if !Prohibit_found!==true (
        echo %COLOR_GREEN% !search_num! 需要護城河%COLOR_RESET%
	echo %COLOR_PURPLE% !search_num! 限新型機台作業%COLOR_RESET%
    ) else (
        echo %COLOR_GREEN% !search_num! 需要護城河. %COLOR_RESET%
    )
) else (
    if !Prohibit_found!==true (
        echo %COLOR_PURPLE%!search_num! 限新型機台作業%COLOR_RESET%
    ) else (
        echo %COLOR_RED%!search_num! 不需要護城河%COLOR_RESET%
    )
)

pause >nul
cls
goto input_loop

endlocal
