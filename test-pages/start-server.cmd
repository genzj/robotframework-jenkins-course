@echo off
pushd %~dp0
set script_dir=%CD%
cd "%script_dir%"
py -3 -m http.server
pause
