@echo off

set first_param=%1

rem http://stackoverflow.com/questions/761615/
shift
set params=%1

:loop
shift
if [%1]==[] goto afterloop
set params=%params% %1
goto loop


:afterloop
if /i "%first_param%" == "c" ( goto process_css )
if /i "%first_param%" == "css" ( goto process_css )
if /i "%first_param%" == "cleancss" ( goto process_css )
if /i "%first_param%" == "j" ( goto process_js )
if /i "%first_param%" == "js" ( goto process_js )
if /i "%first_param%" == "uglifyjs" ( goto process_js )


:help
echo First parameter needs to be "css" or "js".
echo.
echo - "css", "c" or "cleancss" will execute clean-css.
echo - "js", "j" or "uglifyjs" will execute uglify-js.
echo.
echo Subsequent parameters will be passed to their respective tools.
echo.
echo   E.g.: fcompress.exe css style.css -o style.min.css
echo         fcompress.exe js script.js -cm -o script.min.js
goto stop


:process_css
set process=clean-css
goto process_common


:process_js
set process=uglify-js
goto process_common


:process_common
node.exe "node_modules\%process%\bin\%process:-=%" %params%


:stop
