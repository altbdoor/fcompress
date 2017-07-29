@echo off

set run_path=%~dp0
set run_path=%run_path:~0,-1%
set run_mode=%1

rem http://stackoverflow.com/questions/761615/
shift
set params=%1

:loop
shift
if [%1]==[] goto afterloop
set params=%params% %1
goto loop


:afterloop
if /i "%run_mode%" == "c" ( goto process_css )
if /i "%run_mode%" == "css" ( goto process_css )
if /i "%run_mode%" == "cleancss" ( goto process_css )
if /i "%run_mode%" == "j" ( goto process_js )
if /i "%run_mode%" == "js" ( goto process_js )
if /i "%run_mode%" == "uglifyjs" ( goto process_js )


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
set module=clean-css-cli
set binary=cleancss
goto process_common


:process_js
set module=uglify-js
set binary=uglifyjs
goto process_common


:process_common
"%run_path%\node.exe" "%run_path%\node_modules\%module%\bin\%binary%" %params%


:stop
