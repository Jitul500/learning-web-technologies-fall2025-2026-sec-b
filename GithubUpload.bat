@echo off
echo ========================================
echo     SMART AUTO GIT UPLOADER (by Shoieb)
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

:: === STEP 6: Pull latest changes (Rebase mode) ===
echo.
echo 📥 Pulling latest code from GitHub...
git pull origin %BRANCH% --rebase

:: === STEP 7: Push to GitHub (Using -u for safety) ===
echo.
echo 🚀 Uploading code to GitHub...
:: '-u' sets the upstream branch. Safe for first-time and all future pushes.
git push -u origin %BRANCH%

echo.
echo ✅ All done! Code uploaded successfully.
pause