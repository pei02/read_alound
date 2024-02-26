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
set /p search_num="�п�J�}�� (��J ALL �C�X�������e): "

if /i "%search_num%"=="ALL" (
    echo %COLOR_BLUE%�ݭn�@���e���}��: !moat_arr!%COLOR_RESET%
    echo %COLOR_YELLOW%���s���@�~�}��: !Prohibit_arr!%COLOR_RESET%
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
        echo %COLOR_GREEN% !search_num! �ݭn�@���e%COLOR_RESET%
	echo %COLOR_PURPLE% !search_num! ���s�����x�@�~%COLOR_RESET%
    ) else (
        echo %COLOR_GREEN% !search_num! �ݭn�@���e. %COLOR_RESET%
    )
) else (
    if !Prohibit_found!==true (
        echo %COLOR_PURPLE%!search_num! ���s�����x�@�~%COLOR_RESET%
    ) else (
        echo %COLOR_RED%!search_num! ���ݭn�@���e%COLOR_RESET%
    )
)

pause >nul
cls
goto input_loop

endlocal
