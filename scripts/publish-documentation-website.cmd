@echo off
title TIR documentation publisher
echo -------------------------------------
echo Publishing TIR Documentation Website...
echo -------------------------------------

git checkout .
git checkout master

cd ..
cd doc_files
call make.bat clean
call make.bat html
xcopy /E ".\build\html\*" "..\docs\"

echo -------------------------------------
echo Files created and copied to folder: %cd%
echo Publishing on git...
echo -------------------------------------

set date = date /t

git add .
git commit -m "Publishing documentation %date%"
git push