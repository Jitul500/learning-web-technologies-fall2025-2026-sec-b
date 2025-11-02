@echo off
echo ========================================
echo   SMART AUTO GIT UPLOADER (v9)
echo ========================================
echo.

:: === STEP 1: Ask for repository link ===
set /p REPO=Enter your GitHub repository link: 
if "%REPO%"=="" (
    echo ❌ Repository link required!
    pause
    exit /b
)

:: === STEP 2: Ask for branch name ===
set /p BRANCH=Enter branch name (default: main): 
if "%BRANCH%"=="" set BRANCH=main

echo.
echo Repository: %REPO%
echo Branch: %BRANCH%
echo.

:: === STEP 3: Initialize Git if not exists ===
if not exist .git (
    echo 🧱 Initializing new Git repository...
    git init
    git branch -M %BRANCH%
    git remote add origin %REPO%
) else (
    echo ✅ Git repository already initialized.
)

:: === STEP 4: Update remote link (safe) ===
git remote set-url origin %REPO%

:: === STEP 5: Add and commit ===
echo.
echo ➕ Adding all local changes...
git add .

set /p msg=Enter commit message (default: auto update): 
if "%msg%"=="" set msg=auto update

echo 💬 Committing changes...
git commit --allow-empty -m "%msg%"

:: === STEP 6: (NEW) Ask for Pull Strategy ===
echo.
echo ----------------------------------------
echo   ❓ Pull Strategy Select Korun
echo ----------------------------------------
echo    [1] Solo Project (Rebase use korbo)
echo    [2] Group Project (Merge use korbo)
echo.

choice /c:12 /n /m "Apni ki bhabe kaj korchen [1 or 2]? "

if errorlevel 2 (
    echo.
    echo ✅ Group mode: 'merge' (default pull) select kora holo.
    set PULL_CMD=git pull origin %BRANCH% --no-edit
) else (
    echo.
    echo ✅ Solo mode: 'rebase' select kora holo.
    set PULL_CMD=git pull origin %BRANCH% --rebase --autostash
)
    
echo.
echo 📥 GitHub theke code pull korchi...
%PULL_CMD%
    
:: === STEP 7: Push to GitHub ===
echo.
echo 🚀 Uploading code to GitHub...
git push -u origin %BRANCH%

echo.
echo ✅ All done! Code uploaded successfully.
pause