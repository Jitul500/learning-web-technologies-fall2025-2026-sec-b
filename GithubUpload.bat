@echo off
setlocal
echo ========================================
echo   SMART AUTO GIT UPLOADER (v-Shoieb)
echo   (Solo/Group Edition)
echo ========================================
echo.

:: === STEP 1: Ask for repository link ===
set /p REPO=Enter your GitHub repository link: 
if "%REPO%"=="" (
    echo ❌ Repository link required!
    pause
    exit /b
)

:: === STEP 2: Ask for branch name (Default changed to 'main') ===
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

:: === STEP 5: Add and commit (Moved before pull) ===
echo.
echo ➕ Adding all local changes...
git add .

set /p msg=Enter commit message (default: auto update): 
if "%msg%"=="" set msg=auto update

echo 💬 Committing changes...
:: --allow-empty flag ensures script doesn't stop if there are no changes
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
    :: Group-er jonno default merge strategy (apnar system follow kore)
    set PULL_CMD=git pull origin %BRANCH%
) else (
    echo.
    echo ✅ Solo mode: 'rebase' select kora holo.
    :: Solo-r jonno rebase strategy (apnar deya code onusare)
    set PULL_CMD=git pull origin %BRANCH% --rebase
)
    
echo.
echo 📥 GitHub theke code pull korchi...
%PULL_CMD%
    
:: === STEP 7: Push to GitHub (Using -u for safety) ===
echo.
echo 🚀 Uploading code to GitHub...
:: '-u' sets the upstream branch. Safe for first-time and all future pushes.
git push -u origin %BRANCH%

echo.
echo ✅ All done! Code uploaded successfully.
pause
endlocal