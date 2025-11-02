@echo off
echo ========================================
echo     GIT UPLOAD SCRIPT (by Jitul)
echo ========================================
echo.

:: GitHub repository link
set REPO=https://github.com/Jitul500/learning-web-technologies-fall2025-2026-sec-b.git

:: Branch name 
set BRANCH=master

echo.
echo 🔄 Remote link check korchi...
git remote set-url origin %REPO%

echo.
echo 📥 GitHub theke latest code pull korchi (Merge mode)...
:: --rebase baad deya holo, eta default merge strategy use korbe
git pull origin %BRANCH%

echo.
echo ➕ Sob local poriborton add korchi...
git add .

echo.
:: Commit message-er jonno input chawa hocche
set /p msg=Enter commit message (default: Auto Update): 
if "%msg%"=="" set msg=Auto Update

echo.
echo 💬 Changes commit korchi...
git commit -m "%msg%"

echo.
echo 🚀 GitHub-e code push korchi...
git push origin %BRANCH%

echo.
echo ✅ Upload complete!
pause